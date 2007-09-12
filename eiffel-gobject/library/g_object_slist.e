indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class G_OBJECT_SLIST [ITEM -> G_OBJECT]
	-- A G_SLIST variant, specific for G_OBJECT. The G_OBJECT_FACTORY is
	-- created by the list itself, thus saving some typing in client
	-- code, without sacrifying readability. 

inherit G_SLIST [ITEM]
		redefine
			-- copy,
			from_external_pointer -- ,
			-- is_equal,
			-- is_equal_map
		end 
	
creation make, from_external_pointer

feature -- Creation
	from_external_pointer (a_pointer: POINTER) is
		do
			create {G_OBJECT_FACTORY[ITEM]} factory
			handle := a_pointer
		end

-- 	copy (other: like Current) is
-- 		do
-- 			not_yet_implemented
-- 		end
	
-- feature -- Queries
-- 	is_equal (other: like Current): BOOLEAN is
-- 		do
-- 			not_yet_implemented
-- 		end

-- 	is_equal_map (other: like Current): BOOLEAN is
-- 			-- Do both collections have the same lower, upper, and items?
-- 			-- Feature is_equal is used for comparison of items.
-- 		do
-- 			not_yet_implemented
-- 		end

end -- class G_OBJECT_LIST
