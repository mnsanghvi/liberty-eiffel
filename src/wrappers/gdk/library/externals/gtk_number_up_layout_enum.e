-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_NUMBER_UP_LAYOUT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = left_to_right_top_to_bottom_low_level)  or else
				(a_value = left_to_right_bottom_to_top_low_level)  or else
				(a_value = right_to_left_top_to_bottom_low_level)  or else
				(a_value = right_to_left_bottom_to_top_low_level)  or else
				(a_value = top_to_bottom_left_to_right_low_level)  or else
				(a_value = top_to_bottom_right_to_left_low_level)  or else
				(a_value = bottom_to_top_left_to_right_low_level)  or else
				(a_value = bottom_to_top_right_to_left_low_level) )
		end

feature -- Setters
	default_create,
	set_left_to_right_top_to_bottom is
		do
			value := left_to_right_top_to_bottom_low_level
		end

	set_left_to_right_bottom_to_top is
		do
			value := left_to_right_bottom_to_top_low_level
		end

	set_right_to_left_top_to_bottom is
		do
			value := right_to_left_top_to_bottom_low_level
		end

	set_right_to_left_bottom_to_top is
		do
			value := right_to_left_bottom_to_top_low_level
		end

	set_top_to_bottom_left_to_right is
		do
			value := top_to_bottom_left_to_right_low_level
		end

	set_top_to_bottom_right_to_left is
		do
			value := top_to_bottom_right_to_left_low_level
		end

	set_bottom_to_top_left_to_right is
		do
			value := bottom_to_top_left_to_right_low_level
		end

	set_bottom_to_top_right_to_left is
		do
			value := bottom_to_top_right_to_left_low_level
		end

feature -- Queries
	is_left_to_right_top_to_bottom: BOOLEAN is
		do
			Result := (value=left_to_right_top_to_bottom_low_level)
		end

	is_left_to_right_bottom_to_top: BOOLEAN is
		do
			Result := (value=left_to_right_bottom_to_top_low_level)
		end

	is_right_to_left_top_to_bottom: BOOLEAN is
		do
			Result := (value=right_to_left_top_to_bottom_low_level)
		end

	is_right_to_left_bottom_to_top: BOOLEAN is
		do
			Result := (value=right_to_left_bottom_to_top_low_level)
		end

	is_top_to_bottom_left_to_right: BOOLEAN is
		do
			Result := (value=top_to_bottom_left_to_right_low_level)
		end

	is_top_to_bottom_right_to_left: BOOLEAN is
		do
			Result := (value=top_to_bottom_right_to_left_low_level)
		end

	is_bottom_to_top_left_to_right: BOOLEAN is
		do
			Result := (value=bottom_to_top_left_to_right_low_level)
		end

	is_bottom_to_top_right_to_left: BOOLEAN is
		do
			Result := (value=bottom_to_top_right_to_left_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	left_to_right_top_to_bottom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_TOP_TO_BOTTOM"
 			}"
 		end

	left_to_right_bottom_to_top_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_LEFT_TO_RIGHT_BOTTOM_TO_TOP"
 			}"
 		end

	right_to_left_top_to_bottom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_TOP_TO_BOTTOM"
 			}"
 		end

	right_to_left_bottom_to_top_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_RIGHT_TO_LEFT_BOTTOM_TO_TOP"
 			}"
 		end

	top_to_bottom_left_to_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_LEFT_TO_RIGHT"
 			}"
 		end

	top_to_bottom_right_to_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_TOP_TO_BOTTOM_RIGHT_TO_LEFT"
 			}"
 		end

	bottom_to_top_left_to_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_LEFT_TO_RIGHT"
 			}"
 		end

	bottom_to_top_right_to_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NUMBER_UP_LAYOUT_BOTTOM_TO_TOP_RIGHT_TO_LEFT"
 			}"
 		end


end -- class GTK_NUMBER_UP_LAYOUT_ENUM
