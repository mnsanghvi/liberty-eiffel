-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_PERMUTE_COMPLEX_DOUBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_permute_complex (a_p: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_permute_complex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_complex"
		}"
		end

	gsl_permute_complex_inverse (a_p: POINTER; a_data: POINTER; a_stride: like size_t; a_n: like size_t): INTEGER is
 		-- gsl_permute_complex_inverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_permute_complex_inverse"
		}"
		end


end -- class GSL_PERMUTE_COMPLEX_DOUBLE_EXTERNALS
