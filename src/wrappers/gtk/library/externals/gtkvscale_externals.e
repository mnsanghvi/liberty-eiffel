-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVSCALE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_vscale_new_with_range (a_min: REAL_64; a_max: REAL_64; a_step: REAL_64): POINTER is
 		-- gtk_vscale_new_with_range (node at line 2535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vscale_new_with_range"
		}"
		end

	gtk_vscale_new (an_adjustment: POINTER): POINTER is
 		-- gtk_vscale_new (node at line 13472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vscale_new"
		}"
		end

	gtk_vscale_get_type: NATURAL_32 is
 		-- gtk_vscale_get_type (node at line 19446)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vscale_get_type()"
		}"
		end


end -- class GTKVSCALE_EXTERNALS
