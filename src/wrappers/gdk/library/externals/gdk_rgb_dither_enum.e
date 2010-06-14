-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_RGB_DITHER_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = max_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_normal is
		do
			value := normal_low_level
		end

	set_max is
		do
			value := max_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	is_max: BOOLEAN is
		do
			Result := (value=max_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RGB_DITHER_NONE"
 			}"
 		end

	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RGB_DITHER_NORMAL"
 			}"
 		end

	max_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RGB_DITHER_MAX"
 			}"
 		end


end -- class GDK_RGB_DITHER_ENUM
