-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CELL_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_cell_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GTK_CELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_struct_set_type"
		}"
		end

	gtk_cell_struct_set_vertical (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for vertical field of GTK_CELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_struct_set_vertical"
		}"
		end

	gtk_cell_struct_set_horizontal (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for horizontal field of GTK_CELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_struct_set_horizontal"
		}"
		end

	gtk_cell_struct_set_style (a_structure: POINTER; a_value: POINTER) is
			-- Setter for style field of GTK_CELL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_struct_set_style"
		}"
		end

feature {} -- Low-level queries

	gtk_cell_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GTK_CELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_struct_get_type"
		}"
		end

	gtk_cell_struct_get_vertical (a_structure: POINTER): INTEGER_16 is
			-- Query for vertical field of GTK_CELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_struct_get_vertical"
		}"
		end

	gtk_cell_struct_get_horizontal (a_structure: POINTER): INTEGER_16 is
			-- Query for horizontal field of GTK_CELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_struct_get_horizontal"
		}"
		end

	gtk_cell_struct_get_style (a_structure: POINTER): POINTER is
			-- Query for style field of GTK_CELL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_struct_get_style"
		}"
		end

	-- Unwrappable field u.
feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCell"
		}"
		end

end -- class GTK_CELL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

