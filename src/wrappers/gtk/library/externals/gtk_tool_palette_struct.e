-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TOOL_PALETTE_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_tool_palette_struct_set_priv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv field of GTK_TOOL_PALETTE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_struct_set_priv"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_tool_palette_struct_get_priv (a_structure: POINTER): POINTER is
			-- Query for priv field of GTK_TOOL_PALETTE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_struct_get_priv"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkToolPalette"
		}"
		end

end -- class GTK_TOOL_PALETTE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

