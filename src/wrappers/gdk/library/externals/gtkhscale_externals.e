-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHSCALE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_hscale_new (an_adjustment: POINTER): POINTER is
 		-- gtk_hscale_new (node at line 12852)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hscale_new"
		}"
		end

	gtk_hscale_new_with_range (a_min: REAL_64; a_max: REAL_64; a_step: REAL_64): POINTER is
 		-- gtk_hscale_new_with_range (node at line 18620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hscale_new_with_range"
		}"
		end

	gtk_hscale_get_type: NATURAL_32 is
 		-- gtk_hscale_get_type (node at line 28048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hscale_get_type()"
		}"
		end


end -- class GTKHSCALE_EXTERNALS
