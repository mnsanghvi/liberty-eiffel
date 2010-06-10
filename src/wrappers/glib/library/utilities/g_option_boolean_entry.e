indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Glib developers
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class G_OPTION_BOOLEAN_ENTRY
	-- A boolean GOptionEntry.

inherit 
	G_OPTION_ENTRY redefine make, fill_tagged_out_memory end

	-- TODO: this should be a REFERENCE[BOOLEAN], but it is not easily
	-- implementable because REFERENCE's item is an effective attribute
	-- while the option entry at C level in an integer. The following
	-- inheriting clauses may be needed: undefine copy redefine is_equal,
	-- item, set_item, fill_tagged_out_memory end

creation make
	
feature 
	make (a_long_name: STRING; a_short_name: CHARACTER; a_description: STRING) is
		local t: like argument_type
		do
			Precursor (a_long_name,a_short_name, a_description)
			t.set_none
			goption_entry_struct_set_arg(handle, t.value)
			goption_entry_struct_set_arg_data(handle, $hidden_value)
		end

feature
	-- is_equal (another: like Current): BOOLEAN is
	-- 	do
	-- 		Result := item=another.item
	-- 	end

	item: BOOLEAN is 
		do 
			Result:=hidden_value.to_boolean 
		end

	set_item(a_boolean: like item) is
		do
			hidden_value:=a_boolean.to_integer
		end

	fill_tagged_out_memory is
		do
			Precursor
			item.append_in(tagged_out_memory)
		end

feature {} -- Implementation
	hidden_value: INTEGER
	
invariant
	boolean: argument_type.is_none
	-- Note: the name picked in Glib is quite a poor choice....
end -- class G_OPTION_BOOLEAN_ENTRY

