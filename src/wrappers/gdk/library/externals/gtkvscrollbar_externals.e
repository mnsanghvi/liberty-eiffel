-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVSCROLLBAR_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_vscrollbar_get_type: NATURAL_32 is
 		-- gtk_vscrollbar_get_type (node at line 26176)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vscrollbar_get_type()"
		}"
		end

	gtk_vscrollbar_new (an_adjustment: POINTER): POINTER is
 		-- gtk_vscrollbar_new (node at line 32808)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vscrollbar_new"
		}"
		end


end -- class GTKVSCROLLBAR_EXTERNALS
