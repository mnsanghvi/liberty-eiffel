-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GFLAGS_VALUE_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gflags_value_struct_set_value (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for value field of GFLAGS_VALUE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gflags_value_struct_set_value"
		}"
		end

	gflags_value_struct_set_value_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value_name field of GFLAGS_VALUE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gflags_value_struct_set_value_name"
		}"
		end

	gflags_value_struct_set_value_nick (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value_nick field of GFLAGS_VALUE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gflags_value_struct_set_value_nick"
		}"
		end

feature {} -- Low-level queries

	gflags_value_struct_get_value (a_structure: POINTER): NATURAL_32 is
			-- Query for value field of GFLAGS_VALUE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gflags_value_struct_get_value"
		}"
		end

	gflags_value_struct_get_value_name (a_structure: POINTER): POINTER is
			-- Query for value_name field of GFLAGS_VALUE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gflags_value_struct_get_value_name"
		}"
		end

	gflags_value_struct_get_value_nick (a_structure: POINTER): POINTER is
			-- Query for value_nick field of GFLAGS_VALUE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gflags_value_struct_get_value_nick"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GFlagsValue"
		}"
		end

end -- class GFLAGS_VALUE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

