-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOGGLEACTION_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_toggle_action_get_draw_as_radio (an_action: POINTER): INTEGER_32 is
 		-- gtk_toggle_action_get_draw_as_radio (node at line 9315)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_get_draw_as_radio"
		}"
		end

	gtk_toggle_action_set_active (an_action: POINTER; an_is_active: INTEGER_32) is
 		-- gtk_toggle_action_set_active (node at line 10800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_set_active"
		}"
		end

	gtk_toggle_action_get_type: NATURAL_32 is
 		-- gtk_toggle_action_get_type (node at line 11795)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_get_type()"
		}"
		end

	gtk_toggle_action_toggled (an_action: POINTER) is
 		-- gtk_toggle_action_toggled (node at line 13227)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_toggled"
		}"
		end

	gtk_toggle_action_set_draw_as_radio (an_action: POINTER; a_draw_as_radio: INTEGER_32) is
 		-- gtk_toggle_action_set_draw_as_radio (node at line 15222)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_set_draw_as_radio"
		}"
		end

	gtk_toggle_action_get_active (an_action: POINTER): INTEGER_32 is
 		-- gtk_toggle_action_get_active (node at line 26212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_get_active"
		}"
		end

	gtk_toggle_action_new (a_name: POINTER; a_label: POINTER; a_tooltip: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_toggle_action_new (node at line 31277)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_new"
		}"
		end


end -- class GTKTOGGLEACTION_EXTERNALS
