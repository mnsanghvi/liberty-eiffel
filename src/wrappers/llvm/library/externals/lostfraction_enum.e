-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LOSTFRACTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = exactly_zero_low_level)  or else
				(a_value = exactly_half_low_level)  or else
				(a_value = more_than_half_low_level) )
		end

feature -- Setters
	default_create,
	set_exactly_zero is
		do
			value := exactly_zero_low_level
		end

	set_exactly_half is
		do
			value := exactly_half_low_level
		end

	set_more_than_half is
		do
			value := more_than_half_low_level
		end

feature -- Queries
	is_exactly_zero: BOOLEAN is
		do
			Result := (value=exactly_zero_low_level)
		end

	is_exactly_half: BOOLEAN is
		do
			Result := (value=exactly_half_low_level)
		end

	is_more_than_half: BOOLEAN is
		do
			Result := (value=more_than_half_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	exactly_zero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "lfExactlyZero"
 			}"
 		end

	exactly_half_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "lfExactlyHalf"
 			}"
 		end

	more_than_half_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "lfMoreThanHalf"
 			}"
 		end


end -- class LOSTFRACTION_ENUM