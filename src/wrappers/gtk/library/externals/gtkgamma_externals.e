-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKGAMMA_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_gamma_curve_new: POINTER is
 		-- gtk_gamma_curve_new (node at line 16215)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_gamma_curve_new()"
		}"
		end

	gtk_gamma_curve_get_type: NATURAL_32 is
 		-- gtk_gamma_curve_get_type (node at line 35989)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_gamma_curve_get_type()"
		}"
		end


end -- class GTKGAMMA_EXTERNALS
