-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GCLOSURE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_cclosure_marshal_generic (a_closure: POINTER; a_return_gvalue: POINTER; a_n_param_values: NATURAL_32; a_param_values: POINTER; an_invocation_hint: POINTER; a_marshal_data: POINTER) is
 		-- g_cclosure_marshal_generic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cclosure_marshal_generic"
		}"
		end

	g_cclosure_marshal_generic_va (a_closure: POINTER; a_return_value: POINTER; an_instance: POINTER; an_args_list: POINTER; a_marshal_data: POINTER; a_n_params: INTEGER_32; a_param_types: POINTER) is
 		-- g_cclosure_marshal_generic_va
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cclosure_marshal_generic_va"
		}"
		end

	g_cclosure_new (a_callback_func: POINTER; an_user_data: POINTER; a_destroy_data: POINTER): POINTER is
 		-- g_cclosure_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cclosure_new"
		}"
		end

	g_cclosure_new_swap (a_callback_func: POINTER; an_user_data: POINTER; a_destroy_data: POINTER): POINTER is
 		-- g_cclosure_new_swap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_cclosure_new_swap"
		}"
		end

	g_closure_add_finalize_notifier (a_closure: POINTER; a_notify_data: POINTER; a_notify_func: POINTER) is
 		-- g_closure_add_finalize_notifier
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_add_finalize_notifier"
		}"
		end

	g_closure_add_invalidate_notifier (a_closure: POINTER; a_notify_data: POINTER; a_notify_func: POINTER) is
 		-- g_closure_add_invalidate_notifier
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_add_invalidate_notifier"
		}"
		end

	g_closure_add_marshal_guards (a_closure: POINTER; a_pre_marshal_data: POINTER; a_pre_marshal_notify: POINTER; a_post_marshal_data: POINTER; a_post_marshal_notify: POINTER) is
 		-- g_closure_add_marshal_guards
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_add_marshal_guards"
		}"
		end

	g_closure_invalidate (a_closure: POINTER) is
 		-- g_closure_invalidate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_invalidate"
		}"
		end

	g_closure_invoke (a_closure: POINTER; a_return_value: POINTER; a_n_param_values: NATURAL_32; a_param_values: POINTER; an_invocation_hint: POINTER) is
 		-- g_closure_invoke
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_invoke"
		}"
		end

	g_closure_new_simple (a_sizeof_closure: NATURAL_32; a_data: POINTER): POINTER is
 		-- g_closure_new_simple
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_new_simple"
		}"
		end

	g_closure_ref (a_closure: POINTER): POINTER is
 		-- g_closure_ref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_ref"
		}"
		end

	g_closure_remove_finalize_notifier (a_closure: POINTER; a_notify_data: POINTER; a_notify_func: POINTER) is
 		-- g_closure_remove_finalize_notifier
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_remove_finalize_notifier"
		}"
		end

	g_closure_remove_invalidate_notifier (a_closure: POINTER; a_notify_data: POINTER; a_notify_func: POINTER) is
 		-- g_closure_remove_invalidate_notifier
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_remove_invalidate_notifier"
		}"
		end

	g_closure_set_marshal (a_closure: POINTER; a_marshal: POINTER) is
 		-- g_closure_set_marshal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_set_marshal"
		}"
		end

	g_closure_set_meta_marshal (a_closure: POINTER; a_marshal_data: POINTER; a_meta_marshal: POINTER) is
 		-- g_closure_set_meta_marshal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_set_meta_marshal"
		}"
		end

	g_closure_sink (a_closure: POINTER) is
 		-- g_closure_sink
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_sink"
		}"
		end

	g_closure_unref (a_closure: POINTER) is
 		-- g_closure_unref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_unref"
		}"
		end

	g_signal_type_cclosure_new (an_itype: NATURAL_64; a_struct_offset: NATURAL_32): POINTER is
 		-- g_signal_type_cclosure_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_signal_type_cclosure_new"
		}"
		end


end -- class GCLOSURE_EXTERNALS
