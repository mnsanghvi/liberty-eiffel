-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class EVENTENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = erase_event_low_level)  or else
				(a_value = copyfmt_event_low_level) )
		end

feature -- Setters
	default_create,
	set_erase_event is
		do
			value := erase_event_low_level
		end

	set_copyfmt_event is
		do
			value := copyfmt_event_low_level
		end

feature -- Queries
	is_erase_event: BOOLEAN is
		do
			Result := (value=erase_event_low_level)
		end

	is_copyfmt_event: BOOLEAN is
		do
			Result := (value=copyfmt_event_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	erase_event_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "erase_event"
 			}"
 		end

	copyfmt_event_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "copyfmt_event"
 			}"
 		end


end -- class EVENTENUM