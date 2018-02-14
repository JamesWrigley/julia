# This file is a part of Julia. License is MIT: https://julialang.org/license

mutable struct Set{T} <: AbstractSet{T}
    dict::Dict{T,Nothing}

    Set{T}() where {T} = new(Dict{T,Nothing}())
    Set{T}(s::Set{T}) where {T} = new(Dict{T,Nothing}(s.dict))
end

Set{T}(itr) where {T} = union!(Set{T}(), itr)
Set() = Set{Any}()


"""
    Set([itr])

Construct a [`Set`](@ref) of the values generated by the given iterable object, or an
empty set. Should be used instead of [`BitSet`](@ref) for sparse integer sets, or
for sets of arbitrary objects.
"""
Set(itr) = Set{eltype(itr)}(itr)
function Set(g::Generator)
    T = @default_eltype(g)
    (isconcretetype(T) || T === Union{}) || return grow_to!(Set{T}(), g)
    return Set{T}(g)
end

empty(s::AbstractSet{T}, ::Type{U}=T) where {T,U} = Set{U}()

# return an empty set with eltype T, which is mutable (can be grown)
# by default, a Set is returned
emptymutable(s::AbstractSet{T}, ::Type{U}=T) where {T,U} = Set{U}()

_similar_for(c::AbstractSet, T, itr, isz) = empty(c, T)

function show(io::IO, s::Set)
    print(io, "Set(")
    show_vector(io, s)
    print(io, ')')
end

isempty(s::Set) = isempty(s.dict)
length(s::Set)  = length(s.dict)
in(x, s::Set) = haskey(s.dict, x)
push!(s::Set, x) = (s.dict[x] = nothing; s)
pop!(s::Set, x) = (pop!(s.dict, x); x)
pop!(s::Set, x, deflt) = x in s ? pop!(s, x) : deflt

function pop!(s::Set)
    isempty(s) && throw(ArgumentError("set must be non-empty"))
    idx = start(s.dict)
    val = s.dict.keys[idx]
    _delete!(s.dict, idx)
    val
end

delete!(s::Set, x) = (delete!(s.dict, x); s)

copy(s::Set) = copymutable(s)

# Set is the default mutable fall-back
copymutable(s::AbstractSet{T}) where {T} = Set{T}(s)

sizehint!(s::Set, newsz) = (sizehint!(s.dict, newsz); s)
empty!(s::Set) = (empty!(s.dict); s)
rehash!(s::Set) = (rehash!(s.dict); s)

start(s::Set)       = start(s.dict)
done(s::Set, state) = done(s.dict, state)
# NOTE: manually optimized to take advantage of Dict representation
next(s::Set, i)     = (s.dict.keys[i], skip_deleted(s.dict, i+1))

"""
    unique(itr)

Return an array containing only the unique elements of collection `itr`,
as determined by [`isequal`](@ref), in the order that the first of each
set of equivalent elements originally appears. The element type of the
input is preserved.

# Examples
```jldoctest
julia> unique([1, 2, 6, 2])
3-element Array{Int64,1}:
 1
 2
 6

julia> unique(Real[1, 1.0, 2])
2-element Array{Real,1}:
 1
 2
```
"""
function unique(itr)
    T = @default_eltype(itr)
    out = Vector{T}()
    seen = Set{T}()
    i = start(itr)
    if done(itr, i)
        return out
    end
    x, i = next(itr, i)
    if !isconcretetype(T) && IteratorEltype(itr) == EltypeUnknown()
        S = typeof(x)
        return _unique_from(itr, S[x], Set{S}((x,)), i)
    end
    push!(seen, x)
    push!(out, x)
    return unique_from(itr, out, seen, i)
end

_unique_from(itr, out, seen, i) = unique_from(itr, out, seen, i)
@inline function unique_from(itr, out::Vector{T}, seen, i) where T
    while !done(itr, i)
        x, i = next(itr, i)
        S = typeof(x)
        if !(S === T || S <: T)
            R = promote_typejoin(S, T)
            seenR = convert(Set{R}, seen)
            outR = convert(Vector{R}, out)
            if !in(x, seenR)
                push!(seenR, x)
                push!(outR, x)
            end
            return _unique_from(itr, outR, seenR, i)
        end
        if !in(x, seen)
            push!(seen, x)
            push!(out, x)
        end
    end
    return out
end

"""
    unique(f, itr)

Returns an array containing one value from `itr` for each unique value produced by `f`
applied to elements of `itr`.

# Examples
```jldoctest
julia> unique(x -> x^2, [1, -1, 3, -3, 4])
3-element Array{Int64,1}:
 1
 3
 4
```
"""
function unique(f::Callable, C)
    out = Vector{eltype(C)}()
    seen = Set()
    for x in C
        y = f(x)
        if !in(y, seen)
            push!(seen, y)
            push!(out, x)
        end
    end
    out
end

# If A is not grouped, then we will need to keep track of all of the elements that we have
# seen so far.
function _unique!(A::AbstractVector)
    seen = Set{eltype(A)}()
    idxs = eachindex(A)
    i = state = start(idxs)
    for x in A
        if x ∉ seen
            push!(seen, x)
            i, state = next(idxs, state)
            A[i] = x
        end
    end
    resize!(A, i - first(idxs) + 1)
end

# If A is grouped, so that each unique element is in a contiguous group, then we only
# need to keep track of one element at a time. We replace the elements of A with the
# unique elements that we see in the order that we see them. Once we have iterated
# through A, we resize A based on the number of unique elements that we see.
function _groupedunique!(A::AbstractVector)
    isempty(A) && return A
    idxs = eachindex(A)
    y = first(A)
    state = start(idxs)
    i, state = next(idxs, state)
    for x in A
        if !isequal(x, y)
            i, state = next(idxs, state)
            y = A[i] = x
        end
    end
    resize!(A, i - first(idxs) + 1)
end

"""
    unique!(A::AbstractVector)

Remove duplicate items as determined by [`isequal`](@ref), then return the modified `A`.
`unique!` will return the elements of `A` in the order that they occur. If you do not care
about the order of the returned data, then calling `(sort!(A); unique!(A))` will be much
more efficient as long as the elements of `A` can be sorted.

# Examples
```jldoctest
julia> unique!([1, 1, 1])
1-element Array{Int64,1}:
 1

julia> A = [7, 3, 2, 3, 7, 5];

julia> unique!(A)
4-element Array{Int64,1}:
 7
 3
 2
 5

julia> B = [7, 6, 42, 6, 7, 42];

julia> sort!(B);  # unique! is able to process sorted data much more efficiently.

julia> unique!(B)
3-element Array{Int64,1}:
  6
  7
 42
```
"""
function unique!(A::Union{AbstractVector{<:Real}, AbstractVector{<:AbstractString},
                          AbstractVector{<:Symbol}})
    if isempty(A)
        return A
    elseif issorted(A) || issorted(A, rev=true)
        return _groupedunique!(A)
    else
        return _unique!(A)
    end
end
# issorted fails for some element types, so the method above has to be restricted to
# elements with isless/< defined.
function unique!(A)
    if isempty(A)
        return A
    else
        return _unique!(A)
    end
end

"""
    allunique(itr) -> Bool

Return `true` if all values from `itr` are distinct when compared with [`isequal`](@ref).

# Examples
```jldoctest
julia> a = [1; 2; 3]
3-element Array{Int64,1}:
 1
 2
 3

julia> allunique([a, a])
false
```
"""
function allunique(C)
    seen = Set{eltype(C)}()
    for x in C
        if in(x, seen)
            return false
        else
            push!(seen, x)
        end
    end
    true
end

allunique(::Set) = true

allunique(r::AbstractRange{T}) where {T} = (step(r) != zero(T)) || (length(r) <= 1)

filter!(f, s::Set) = unsafe_filter!(f, s)

const hashs_seed = UInt === UInt64 ? 0x852ada37cfe8e0ce : 0xcfe8e0ce
function hash(s::AbstractSet, h::UInt)
    hv = hashs_seed
    for x in s
        hv ⊻= hash(x)
    end
    hash(hv, h)
end

convert(::Type{T}, s::T) where {T<:AbstractSet} = s
convert(::Type{T}, s::AbstractSet) where {T<:AbstractSet} = T(s)


## replace/replace! ##

# to make replace/replace! work for a new container type Cont, only
# replace!(new::Callable, A::Cont; count::Integer=typemax(Int))
# has to be implemented

"""
    replace!(A, old_new::Pair...; [count::Integer])

For each pair `old=>new` in `old_new`, replace all occurrences
of `old` in collection `A` by `new`.
If `count` is specified, then replace at most `count` occurrences in total.
See also [`replace`](@ref replace(A, old_new::Pair...)).

# Examples
```jldoctest
julia> replace!([1, 2, 1, 3], 1=>0, 2=>4, count=2)
4-element Array{Int64,1}:
 0
 4
 1
 3

julia> replace!(Set([1, 2, 3]), 1=>0)
Set([0, 2, 3])
```
"""
replace!(A, old_new::Pair...; count::Integer=typemax(Int)) = _replace!(A, eltype(A), count, old_new)

function _replace!(A, ::Type{K}, count::Integer, old_new::Tuple{Vararg{Pair}}) where K
    @inline function new(x)
        for o_n in old_new
            first(o_n) == x && return last(o_n)
        end
        return x # no replace
    end
    replace!(new, A, count=count)
end

"""
    replace!(pred::Function, A, new; [count::Integer])

Replace all occurrences `x` in collection `A` for which `pred(x)` is true
by `new`.

# Examples
```jldoctest
julia> A = [1, 2, 3, 1];

julia> replace!(isodd, A, 0, count=2)
4-element Array{Int64,1}:
 0
 2
 0
 1
```
"""
replace!(pred::Callable, A, new; count::Integer=typemax(Int)) =
    replace!(x -> ifelse(pred(x), new, x), A, count=count)

"""
    replace!(new::Function, A; [count::Integer])

Replace each element `x` in collection `A` by `new(x)`.
If `count` is specified, then replace at most `count` values in total
(replacements being defined as `new(x) !== x`).

# Examples
```jldoctest
julia> replace!(x -> isodd(x) ? 2x : x, [1, 2, 3, 4])
4-element Array{Int64,1}:
 2
 2
 6
 4

julia> replace!(Dict(1=>2, 3=>4)) do kv
           first(kv) < 3 ? first(kv)=>3 : kv
       end
Dict{Int64,Int64} with 2 entries:
  3 => 4
  1 => 3

julia> replace!(x->2x, Set([3, 6]))
Set([6, 12])
```
"""
function replace!(new::Callable, A::Union{AbstractArray,AbstractDict,AbstractSet};
                  count::Integer=typemax(Int))
    count < 0 && throw(DomainError(count, "`count` must not be negative"))
    count != 0 && _replace!(new, A, min(count, typemax(Int)) % Int)
    A
end

"""
    replace(A, old_new::Pair...; [count::Integer])

Return a copy of collection `A` where, for each pair `old=>new` in `old_new`,
all occurrences of `old` are replaced by `new`.
If `count` is specified, then replace at most `count` occurrences in total.
See also [`replace!`](@ref).

# Examples
```jldoctest
julia> replace([1, 2, 1, 3], 1=>0, 2=>4, count=2)
4-element Array{Int64,1}:
 0
 4
 1
 3
```
"""
replace(A, old_new::Pair...; count::Integer=typemax(Int)) =
    _replace!(copy(A), eltype(A), count, old_new)

"""
    replace(pred::Function, A, new; [count::Integer])

Return a copy of collection `A` where all occurrences `x` for which
`pred(x)` is true are replaced by `new`.

# Examples
```jldoctest
julia> replace(isodd, [1, 2, 3, 1], 0, count=2)
4-element Array{Int64,1}:
 0
 2
 0
 1
```
"""
replace(pred::Callable, A, new; count::Integer=typemax(Int)) =
    replace!(pred, copy(A), new, count=count)

"""
    replace(new::Function, A; [count::Integer])

Return a copy of `A` where each value `x` in `A` is replaced by `new(x)`

# Examples
```jldoctest
julia> replace(x -> isodd(x) ? 2x : x, [1, 2, 3, 4])
4-element Array{Int64,1}:
 2
 2
 6
 4

julia> replace(Dict(1=>2, 3=>4)) do kv
           first(kv) < 3 ? first(kv)=>3 : kv
       end
Dict{Int64,Int64} with 2 entries:
  3 => 4
  1 => 3
```
"""
replace(new::Callable, A; count::Integer=typemax(Int)) = replace!(new, copy(A), count=count)

# Handle ambiguities
replace!(a::Callable, b::Pair; count::Integer=-1) = throw(MethodError(replace!, (a, b)))
replace!(a::Callable, b::Pair, c::Pair; count::Integer=-1) = throw(MethodError(replace!, (a, b, c)))
replace(a::Callable, b::Pair; count::Integer=-1) = throw(MethodError(replace, (a, b)))
replace(a::Callable, b::Pair, c::Pair; count::Integer=-1) = throw(MethodError(replace, (a, b, c)))
replace(a::AbstractString, b::Pair, c::Pair) = throw(MethodError(replace, (a, b, c)))


### replace! for AbstractDict/AbstractSet

askey(k, ::AbstractDict) = k.first
askey(k, ::AbstractSet) = k

function _replace!(new::Callable, A::Union{AbstractDict,AbstractSet}, count::Int)
    repl = Pair{eltype(A),eltype(A)}[]
    c = 0
    for x in A
        y = new(x)
        if x !== y
            push!(repl, x => y)
            c += 1
        end
        c == count && break
    end
    for oldnew in repl
        pop!(A, askey(first(oldnew), A))
    end
    for oldnew in repl
        push!(A, last(oldnew))
    end
end

### AbstractArray

function _replace!(new::Callable, A::AbstractArray, count::Int)
    c = 0
    for i in eachindex(A)
        @inbounds Ai = A[i]
        y = new(Ai)
        if Ai !== y
            @inbounds A[i] = y
            c += 1
        end
        c == count && break
    end
end
