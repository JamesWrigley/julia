# This file is a part of Julia. License is MIT: https://julialang.org/license

precompile(Tuple{typeof(Base.empty!), Base.Dict{Int64, Union{Distributed.Worker, Distributed.LocalProcess}}})
precompile(Tuple{typeof(Core.Compiler.isbits), Distributed.DefaultClusterManager})
precompile(Tuple{typeof(Distributed.init_worker), String, Distributed.DefaultClusterManager})
precompile(Tuple{typeof(Distributed.local_remotecall_thunk), typeof(Distributed.set_valid_processes), Tuple{Array{Int64, 1}}, Array{Any, 1}})
precompile(Tuple{typeof(Distributed.remote_do), typeof(Distributed.set_valid_processes), Distributed.Worker, Array{Int64, 1}})
precompile(Tuple{typeof(Distributed.remote_do), typeof(Distributed.set_valid_processes), Distributed.LocalProcess, Array{Int64, 1}})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remote_do")), Array{Any, 1}, typeof(Distributed.remote_do), typeof(Distributed.set_valid_processes), Distributed.Worker, Array{Int64, 1}})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remote_do")), Array{Any, 1}, typeof(Distributed.remote_do), typeof(Distributed.set_valid_processes), Distributed.LocalProcess, Array{Int64, 1}})
precompile(Tuple{typeof(Distributed.default_addprocs_params)})
precompile(Tuple{typeof(Distributed.topology), Symbol})
precompile(Tuple{typeof(Base.popfirst!), Array{Distributed.WorkerConfig, 1}})
precompile(Tuple{typeof(Distributed.workers)})
precompile(Tuple{getfield(Distributed, Symbol("#kw##addprocs_locked")), Array{Any, 1}, typeof(Distributed.addprocs_locked), Distributed.SSHManager})
precompile(Tuple{typeof(Distributed.check_addprocs_args), Array{Any, 1}})
precompile(Tuple{Type{Distributed.SSHManager}, Array{Any, 1}})
precompile(Tuple{getfield(Distributed, Symbol("#kw##addprocs")), Array{Any, 1}, typeof(Distributed.addprocs), Distributed.SSHManager})
precompile(Tuple{getfield(Distributed, Symbol("#kw##addprocs_locked")), Array{Any, 1}, typeof(Distributed.addprocs_locked), Distributed.LocalManager})
precompile(Tuple{getfield(Distributed, Symbol("#kw##addprocs")), Array{Any, 1}, typeof(Distributed.addprocs), Distributed.LocalManager})
precompile(Tuple{typeof(Distributed.check_master_connect)})
precompile(Tuple{typeof(Distributed.terminate_all_workers)})
precompile(Tuple{typeof(Distributed.local_remotecall_thunk), typeof(Base.exit), Tuple{}, Array{Any, 1}})
precompile(Tuple{typeof(Distributed.remote_do), typeof(Base.exit), Distributed.Worker})
precompile(Tuple{typeof(Distributed.remote_do), typeof(Base.exit), Distributed.LocalProcess})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remote_do")), Array{Any, 1}, typeof(Distributed.remote_do), typeof(Base.exit), Distributed.Worker})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remote_do")), Array{Any, 1}, typeof(Distributed.remote_do), typeof(Base.exit), Distributed.LocalProcess})
precompile(Tuple{typeof(Distributed.set_worker_state), Distributed.Worker, Distributed.WorkerState})
precompile(Tuple{typeof(Distributed.set_worker_state), Distributed.LocalProcess, Distributed.WorkerState})
precompile(Tuple{getfield(Distributed, Symbol("#kw##rmprocs")), Array{Any, 1}, typeof(Distributed.rmprocs), Array{Int64, 1}})
precompile(Tuple{typeof(Distributed.interrupt), Array{Int64, 1}})
precompile(Tuple{typeof(Distributed.flush_gc_msgs)})
precompile(Tuple{typeof(Distributed.addprocs), Int64})
precompile(Tuple{Type{Distributed.WorkerConfig}})
precompile(Tuple{typeof(Distributed.launch), Distributed.LocalManager, Base.Dict{Any, Any}, Array{Distributed.WorkerConfig, 1}, Base.Condition})
precompile(Tuple{typeof(Distributed.start_worker), Base.PipeEndpoint, String})
precompile(Tuple{typeof(Distributed.socket_reuse_port)})
precompile(Tuple{typeof(Distributed.flush_gc_msgs)})
precompile(Tuple{typeof(Distributed.disable_nagle), Base.TCPServer})
precompile(Tuple{typeof(Distributed.next_tunnel_port)})
precompile(Tuple{typeof(Base._delete!), Base.Dict{Int64, Union{Distributed.Worker, Distributed.LocalProcess}}, Int64})
precompile(Tuple{typeof(Distributed.send_msg_), Distributed.Worker, Distributed.MsgHeader, Distributed.JoinPGRPMsg, Bool})
precompile(Tuple{typeof(Distributed.send_msg_now), Distributed.Worker, Distributed.MsgHeader, Distributed.JoinPGRPMsg})
precompile(Tuple{typeof(Distributed.connect_w2w), Int64, Distributed.WorkerConfig})
precompile(Tuple{typeof(Distributed.create_worker), Distributed.LocalManager, Distributed.WorkerConfig})
precompile(Tuple{typeof(Distributed.setup_launched_worker), Distributed.LocalManager, Distributed.WorkerConfig, Array{Int64, 1}})
precompile(Tuple{typeof(Base.connect), Distributed.LocalManager, Int64, Distributed.WorkerConfig})
precompile(Tuple{typeof(Distributed.read_worker_host_port), Base.Pipe})
precompile(Tuple{typeof(Distributed.parse_connection_info), String})
precompile(Tuple{typeof(Distributed.connect_to_worker), Base.SubString{String}, Int16})
precompile(Tuple{typeof(Distributed.process_messages), Base.TCPSocket, Base.TCPSocket, Bool})
precompile(Tuple{getfield(Core, Symbol("#kw#Type")), Array{Any, 1}, Type{Distributed.Worker}, Int64, Base.TCPSocket, Base.TCPSocket, Distributed.LocalManager})
precompile(Tuple{typeof(Distributed.worker_id_from_socket), Base.TCPSocket})
precompile(Tuple{Type{Distributed.ClusterSerializer{Base.TCPSocket}}, Base.TCPSocket})
precompile(Tuple{typeof(Distributed.send_msg_), Distributed.Worker, Distributed.MsgHeader, Distributed.ResultMsg, Bool})
precompile(Tuple{typeof(Distributed.send_msg_now), Distributed.Worker, Distributed.MsgHeader, Distributed.ResultMsg})
precompile(Tuple{typeof(Distributed.register_worker_streams), Distributed.Worker})
precompile(Tuple{typeof(Distributed.register_worker_streams), Distributed.LocalProcess})
precompile(Tuple{Type{Distributed.ClusterSerializer{Base.TCPSocket}}, Base.TCPSocket})
precompile(Tuple{typeof(Distributed.worker_id_from_socket), Base.TCPSocket})
precompile(Tuple{typeof(Base.convert), Type{Distributed.ClusterSerializer{I} where I<:IO}, Distributed.ClusterSerializer{Base.TCPSocket}})
precompile(Tuple{typeof(Base.convert), Type{Distributed.ClusterManager}, Distributed.LocalManager})
precompile(Tuple{typeof(Base.convert), Type{Distributed.WorkerConfig}, Distributed.WorkerConfig})
precompile(Tuple{typeof(Base.get), Base.Dict{Any, Any}, Distributed.RRID, Bool})
precompile(Tuple{typeof(Base.ht_keyindex), Base.Dict{Any, Any}, Distributed.RRID})
precompile(Tuple{typeof(Distributed.local_remotecall_thunk), typeof(Distributed.rmprocs), Tuple{Int64}, Array{Any, 1}})
precompile(Tuple{typeof(Distributed.remote_do), typeof(Distributed.rmprocs), Distributed.Worker, Int64})
precompile(Tuple{typeof(Distributed.remote_do), typeof(Distributed.rmprocs), Distributed.LocalProcess, Int64})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remote_do")), Array{Any, 1}, typeof(Distributed.remote_do), typeof(Distributed.rmprocs), Distributed.Worker, Int64})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remote_do")), Array{Any, 1}, typeof(Distributed.remote_do), typeof(Distributed.rmprocs), Distributed.LocalProcess, Int64})
precompile(Tuple{Type{Distributed.ResultMsg}, Distributed.RemoteException})
precompile(Tuple{Type{Distributed.ResultMsg}, Symbol})
precompile(Tuple{typeof(Distributed.send_msg_now), Base.TCPSocket, Distributed.MsgHeader, Distributed.ResultMsg})
precompile(Tuple{typeof(Base._delete!), Base.Dict{Int64, Union{Distributed.Worker, Distributed.LocalProcess}}, Int64})
precompile(Tuple{typeof(Distributed.def_rv_channel)})
precompile(Tuple{typeof(Base.setindex!), Base.Dict{Any, Any}, Distributed.RemoteValue, Distributed.RRID})
precompile(Tuple{typeof(Base.ht_keyindex2!), Base.Dict{Any, Any}, Distributed.RRID})
precompile(Tuple{typeof(Base._setindex!), Base.Dict{Any, Any}, Distributed.RemoteValue, Distributed.RRID, Int64})
precompile(Tuple{typeof(Base.notify), Base.Condition, Distributed.ProcessExitedException, Bool, Bool})
precompile(Tuple{typeof(Distributed.process_messages), Base.TCPSocket, Base.TCPSocket, Bool})
precompile(Tuple{typeof(Base.pop!), Base.Dict{Int64, Union{Distributed.Worker, Distributed.LocalProcess}}, Int64, Nothing})
precompile(Tuple{typeof(Distributed.send_connection_hdr), Distributed.Worker, Bool})
precompile(Tuple{typeof(Distributed.deregister_worker), Distributed.ProcessGroup, Int64})
precompile(Tuple{typeof(Distributed.process_hdr), Base.TCPSocket, Bool})
precompile(Tuple{typeof(Distributed.deserialize_msg), Distributed.ClusterSerializer{Base.TCPSocket}})
precompile(Tuple{typeof(Distributed.null_id), Distributed.RRID})
precompile(Tuple{typeof(Distributed.deliver_result), Base.TCPSocket, Symbol, Distributed.RRID, Distributed.RemoteException})
precompile(Tuple{typeof(Distributed.disable_nagle), Base.TCPSocket})
precompile(Tuple{typeof(Distributed.message_handler_loop), Base.TCPSocket, Base.TCPSocket, Bool})
precompile(Tuple{typeof(Distributed.process_tcp_streams), Base.TCPSocket, Base.TCPSocket, Bool})
precompile(Tuple{Type{Distributed.JoinPGRPMsg}, Int64, Array{Union{Tuple{Any, Int64}, Tuple{Tuple{}, Any, Bool}}, 1}, Symbol, Bool})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Distributed.JoinPGRPMsg})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Int64})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Array{Union{Tuple{Any, Int64}, Tuple{Tuple{}, Any, Bool}}, 1}})
precompile(Tuple{typeof(Serialization.should_send_whole_type), Distributed.ClusterSerializer{Base.TCPSocket}, Type{Any}})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Core.SimpleVector})
precompile(Tuple{typeof(Serialization.serialize_type_data), Distributed.ClusterSerializer{Base.TCPSocket}, Type{Any}, Bool})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Type{Any}})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Tuple{Int64}})
precompile(Tuple{typeof(Serialization.serialize_cycle), Distributed.ClusterSerializer{Base.TCPSocket}, Type{Union{Tuple{Any, Int64}, Tuple{Tuple{}, Any, Bool}}}})
precompile(Tuple{typeof(Serialization.serialize_type), Distributed.ClusterSerializer{Base.TCPSocket}, DataType})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Bool})
precompile(Tuple{typeof(Distributed.serialize_global_from_main), Distributed.ClusterSerializer{Base.TCPSocket}, Symbol})
precompile(Tuple{typeof(Serialization.serialize_mod_names), Distributed.ClusterSerializer{Base.TCPSocket}, Module})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Symbol})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Module})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Array{Any, 1}})
precompile(Tuple{typeof(Serialization.serialize_cycle), Distributed.ClusterSerializer{Base.TCPSocket}, Core.TypeName})
precompile(Tuple{typeof(Serialization.serialize_typename), Distributed.ClusterSerializer{Base.TCPSocket}, Core.TypeName})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Array{Symbol, 1}})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Core.TypeName})
precompile(Tuple{typeof(Serialization.serialize_cycle_header), Distributed.ClusterSerializer{Base.TCPSocket}, Type{Union{Tuple{Any, Int64}, Tuple{Tuple{}, Any, Bool}}}})
precompile(Tuple{typeof(Serialization.serialize_any), Distributed.ClusterSerializer{Base.TCPSocket}, Type{Union{Tuple{Any, Int64}, Tuple{Tuple{}, Any, Bool}}}})
precompile(Tuple{typeof(Distributed.send_msg_), Distributed.Worker, Distributed.MsgHeader, Distributed.ResultMsg, Bool})
precompile(Tuple{typeof(Distributed.send_msg_now), Distributed.Worker, Distributed.MsgHeader, Distributed.ResultMsg})
precompile(Tuple{typeof(Distributed.local_remotecall_thunk), typeof(Distributed.rmprocs), Tuple{Int64}, Array{Any, 1}})
precompile(Tuple{typeof(Distributed.remote_do), typeof(Distributed.rmprocs), Distributed.Worker, Int64})
precompile(Tuple{typeof(Distributed.remote_do), typeof(Distributed.rmprocs), Distributed.LocalProcess, Int64})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remote_do")), Array{Any, 1}, typeof(Distributed.remote_do), typeof(Distributed.rmprocs), Distributed.Worker, Int64})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remote_do")), Array{Any, 1}, typeof(Distributed.remote_do), typeof(Distributed.rmprocs), Distributed.LocalProcess, Int64})
precompile(Tuple{Type{Distributed.ResultMsg}, Distributed.RemoteException})
precompile(Tuple{Type{Distributed.ResultMsg}, Symbol})
precompile(Tuple{typeof(Distributed.send_msg_now), Base.TCPSocket, Distributed.MsgHeader, Distributed.ResultMsg})
precompile(Tuple{typeof(Base.notify), Base.Condition, Distributed.ProcessExitedException, Bool, Bool})
precompile(Tuple{typeof(Base.pop!), Base.Dict{Int64, Union{Distributed.Worker, Distributed.LocalProcess}}, Int64, Nothing})
precompile(Tuple{typeof(Distributed.deregister_worker), Distributed.ProcessGroup, Int64})
precompile(Tuple{typeof(Distributed.process_hdr), Base.TCPSocket, Bool})
precompile(Tuple{typeof(Distributed.null_id), Distributed.RRID})
precompile(Tuple{typeof(Distributed.deliver_result), Base.TCPSocket, Symbol, Distributed.RRID, Distributed.RemoteException})
precompile(Tuple{typeof(Distributed.disable_nagle), Base.TCPSocket})
precompile(Tuple{typeof(Distributed.message_handler_loop), Base.TCPSocket, Base.TCPSocket, Bool})
precompile(Tuple{typeof(Distributed.process_tcp_streams), Base.TCPSocket, Base.TCPSocket, Bool})
precompile(Tuple{typeof(Serialization.deserialize), Distributed.ClusterSerializer{Base.TCPSocket}, Type{Union}})
precompile(Tuple{typeof(Serialization.deserialize), Distributed.ClusterSerializer{Base.TCPSocket}, Type{Module}})
precompile(Tuple{typeof(Serialization.deserialize), Distributed.ClusterSerializer{Base.TCPSocket}, Type{Core.SimpleVector}})
precompile(Tuple{Type{Distributed.JoinPGRPMsg}, Int64, Array{Union{Tuple{Any, Int64}, Tuple{Tuple{}, Any, Bool}}, 1}, Symbol, Bool})
precompile(Tuple{typeof(Distributed.handle_msg), Distributed.JoinPGRPMsg, Distributed.MsgHeader, Base.TCPSocket, Base.TCPSocket, Base.VersionNumber})
precompile(Tuple{Type{Distributed.WorkerConfig}})
precompile(Tuple{typeof(Distributed.send_msg_), Distributed.Worker, Distributed.MsgHeader, Distributed.JoinCompleteMsg, Bool})
precompile(Tuple{typeof(Distributed.send_msg_now), Distributed.Worker, Distributed.MsgHeader, Distributed.JoinCompleteMsg})
precompile(Tuple{getfield(Core, Symbol("#kw#Type")), Array{Any, 1}, Type{Distributed.Worker}, Int64, Base.TCPSocket, Base.TCPSocket, Distributed.DefaultClusterManager})
precompile(Tuple{typeof(Distributed.register_worker_streams), Distributed.Worker})
precompile(Tuple{typeof(Distributed.register_worker_streams), Distributed.LocalProcess})
precompile(Tuple{typeof(Base.convert), Type{Distributed.ClusterSerializer{I} where I<:IO}, Distributed.ClusterSerializer{Base.TCPSocket}})
precompile(Tuple{typeof(Base.convert), Type{Distributed.ClusterManager}, Distributed.DefaultClusterManager})
precompile(Tuple{typeof(Base.convert), Type{Distributed.WorkerConfig}, Distributed.WorkerConfig})
precompile(Tuple{typeof(Distributed.send_connection_hdr), Distributed.Worker, Bool})
precompile(Tuple{typeof(Distributed.manage), Distributed.LocalManager, Int64, Distributed.WorkerConfig, Symbol})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Distributed.JoinCompleteMsg})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Int64})
precompile(Tuple{typeof(Serialization.deserialize), Distributed.ClusterSerializer{Base.TCPSocket}})
precompile(Tuple{typeof(Serialization.deserialize_cycle), Distributed.ClusterSerializer{Base.TCPSocket}, Expr})
precompile(Tuple{typeof(Serialization.handle_deserialize), Distributed.ClusterSerializer{Base.TCPSocket}, Int32})
precompile(Tuple{typeof(Serialization.deserialize_array), Distributed.ClusterSerializer{Base.TCPSocket}})
precompile(Tuple{typeof(Serialization.deserialize_datatype), Distributed.ClusterSerializer{Base.TCPSocket}})
precompile(Tuple{typeof(Serialization.deserialize_expr), Distributed.ClusterSerializer{Base.TCPSocket}, Int64})
precompile(Tuple{typeof(Serialization.deserialize), Distributed.ClusterSerializer{Base.TCPSocket}, Type{Int64}})
precompile(Tuple{Type{Distributed.JoinCompleteMsg}, Int64, Int64})
precompile(Tuple{typeof(Distributed.handle_msg), Distributed.JoinCompleteMsg, Distributed.MsgHeader, Base.TCPSocket, Base.TCPSocket, Base.VersionNumber})
precompile(Tuple{typeof(Base.hash), Distributed.RemoteChannel{Base.Channel{Any}}, UInt64})
precompile(Tuple{typeof(Base.ht_keyindex), Base.Dict{WeakRef, Nothing}, Distributed.RemoteChannel{Base.Channel{Any}}})
precompile(Tuple{typeof(Distributed.remotecall_fetch), typeof(Distributed.put_ref), Distributed.Worker, Distributed.RRID, Distributed.WorkerPool})
precompile(Tuple{typeof(Distributed.remotecall_fetch), typeof(Distributed.put_ref), Distributed.LocalProcess, Distributed.RRID, Distributed.WorkerPool})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remotecall_fetch")), Array{Any, 1}, typeof(Distributed.remotecall_fetch), typeof(Distributed.put_ref), Distributed.Worker, Distributed.RRID, Distributed.WorkerPool})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remotecall_fetch")), Array{Any, 1}, typeof(Distributed.remotecall_fetch), typeof(Distributed.put_ref), Distributed.LocalProcess, Distributed.RRID, Distributed.WorkerPool})
precompile(Tuple{typeof(Base.finalizer), Distributed.RemoteChannel{Base.Channel{Any}}, typeof(Distributed.finalize_ref)})
precompile(Tuple{typeof(Distributed.test_existing_ref), Distributed.RemoteChannel{Base.Channel{Any}}})
precompile(Tuple{Type{Distributed.RemoteChannel{T} where T<:Base.AbstractChannel}, Int64})
precompile(Tuple{Type{Distributed.WorkerPool}})
precompile(Tuple{typeof(Distributed.default_worker_pool)})
precompile(Tuple{typeof(Distributed.call_on_owner), typeof(Distributed.put_ref), Distributed.RemoteChannel{Base.Channel{Any}}, Distributed.WorkerPool})
precompile(Tuple{typeof(Distributed.put_ref), Distributed.RRID, Distributed.WorkerPool})
precompile(Tuple{typeof(Base.put!), Distributed.RemoteValue, Distributed.WorkerPool})
precompile(Tuple{typeof(Base.put!), Base.Channel{Any}, Distributed.WorkerPool})
precompile(Tuple{typeof(Base.put_buffered), Base.Channel{Any}, Distributed.WorkerPool})
precompile(Tuple{typeof(Base.put_unbuffered), Base.Channel{Any}, Distributed.WorkerPool})
precompile(Tuple{typeof(Base.push!), Distributed.WorkerPool, Int64})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Distributed.RemoteDoMsg})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, typeof(Distributed.set_valid_processes)})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Tuple{Array{Int64, 1}}})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Array{Int64, 1}})
precompile(Tuple{typeof(Serialization.deserialize), Distributed.ClusterSerializer{Base.TCPSocket}, Type{typeof(Distributed.set_valid_processes)}})
precompile(Tuple{typeof(Distributed.handle_msg), Distributed.RemoteDoMsg, Distributed.MsgHeader, Base.TCPSocket, Base.TCPSocket, Base.VersionNumber})
precompile(Tuple{typeof(Distributed.set_valid_processes), Array{Int64, 1}})
precompile(Tuple{typeof(Distributed._rmprocs), Array{Int64, 1}, Float64})
precompile(Tuple{typeof(Base.kill), Distributed.LocalManager, Int64, Distributed.WorkerConfig})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, typeof(Base.exit)})
precompile(Tuple{typeof(Serialization.serialize), Distributed.ClusterSerializer{Base.TCPSocket}, Tuple{}})
precompile(Tuple{typeof(Serialization.deserialize), Distributed.ClusterSerializer{Base.TCPSocket}, Type{typeof(Base.exit)}})
precompile(Tuple{typeof(Distributed.finalize_ref), Distributed.RemoteChannel{Base.Channel{Any}}})
precompile(Tuple{typeof(Distributed.send_del_client), Distributed.RemoteChannel{Base.Channel{Any}}})
precompile(Tuple{typeof(Base.:(==)), Distributed.RemoteChannel{Base.Channel{Any}}, Distributed.RemoteChannel{Base.Channel{Any}}})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remotecall_fetch")), Array{Any, 1}, typeof(Distributed.remotecall_fetch), typeof(Base.open), Distributed.LocalProcess, typeof(Base.read), String})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remotecall_fetch")), Array{Any, 1}, typeof(Distributed.remotecall_fetch), typeof(Base.open), Distributed.Worker, typeof(Base.read), String})
precompile(Tuple{getfield(Distributed, Symbol("#kw##remote_do")), Array{Any, 1}, typeof(Distributed.remote_do), typeof(Base.exit), Distributed.Worker})
precompile(Tuple{getfield(Distributed, Symbol("#kw##rmprocs")), Array{Any, 1}, typeof(Distributed.rmprocs), Array{Int64, 1}})
precompile(Tuple{Type{Distributed.Future}, Int64})
precompile(Tuple{typeof(Distributed.flush_gc_msgs), Distributed.Worker})
precompile(Tuple{typeof(Distributed.remote_do), typeof(Base.exit), Distributed.Worker})
precompile(Tuple{typeof(Distributed.send_del_client), Distributed.Future})
precompile(Tuple{typeof(Distributed.send_msg), Distributed.Worker, Distributed.MsgHeader, Distributed.CallMsg{:call}})
precompile(Tuple{typeof(Distributed.send_msg_), Distributed.Worker, Distributed.MsgHeader, Distributed.CallMsg{:call}, Bool})
precompile(Tuple{typeof(Distributed.send_msg), Distributed.Worker, Distributed.MsgHeader, Distributed.CallMsg{:call_fetch}})
precompile(Tuple{typeof(Distributed.send_msg_), Distributed.Worker, Distributed.MsgHeader, Distributed.CallMsg{:call_fetch}, Bool})
precompile(Tuple{typeof(Distributed.send_msg), Distributed.Worker, Distributed.MsgHeader, Distributed.RemoteDoMsg})
precompile(Tuple{typeof(Distributed.send_msg_), Distributed.Worker, Distributed.MsgHeader, Distributed.RemoteDoMsg, Bool})
precompile(Tuple{typeof(Distributed.terminate_all_workers)})
precompile(Tuple{typeof(Distributed.test_existing_ref), Distributed.Future})
precompile(Tuple{typeof(Base.finalizer), Distributed.Future, typeof(Distributed.finalize_ref)})
precompile(Tuple{typeof(Base.hash), Distributed.Future, UInt64})
precompile(Tuple{typeof(Base.ht_keyindex), Base.Dict{WeakRef, Nothing}, Distributed.Future})
precompile(Tuple{typeof(Base.sync_add), Distributed.Future})
precompile(Tuple{Type{Union{}}, Distributed.RRID})
