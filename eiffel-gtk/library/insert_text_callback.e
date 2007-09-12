indexing
	description: "Generic callback for the insert-text signal"
	copyright: "[
					Copyright (C) 2006 Paolo redaelli, eiffel-libraries team,  GTK+ team and others
					
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

class INSERT_TEXT_CALLBACK

inherit CALLBACK redefine object end

insert G_OBJECT_RETRIEVER [GTK_EDITABLE]

creation dummy, make

feature
	object: GTK_EDITABLE

feature
	callback (new_text: POINTER; new_text_length: INTEGER; position: POINTER; instance: POINTER) is
		local
			new_text_obj: STRING
			position_obj: REFERENCE [INTEGER]
			int_ptr: NATIVE_ARRAY [INTEGER]
		do
			debug
				print ("Callback: instance=") print (instance.to_string) print ("%N")
			end
			-- The following is written with the implicit requirement 
			-- that the editable is actually created by the Eiffel
			-- application. 
			check
				eiffel_created_the_editable: has_eiffel_wrapper_stored (instance)
			end
			object := retrieve_eiffel_wrapper_from_gobject_pointer (instance)
			create new_text_obj.from_external (new_text)
			int_ptr := int_ptr.from_pointer (position)
			create position_obj.set_item (int_ptr.item (0))
			procedure.call ([new_text_obj, new_text_length, position_obj, object])
			int_ptr.put (position_obj.item, 0)
		end

	callback_pointer: POINTER is
		do
			Result := get_callback_pointer ($callback)
		ensure
			Result.is_not_null
		end

	connect (an_object: GTK_EDITABLE; a_procedure: like procedure) is
		do
			debug
				print ("INSERT_TEXT_CALLBACK.connect (an_object=") print (an_object.to_pointer.to_string)
				print (" an_object.handle=") print (an_object.handle.to_string)
				print (") Current=") print (to_pointer.to_string)
				print (" Current.handle=") print (handle.to_string)
				print ("%N")
			end
					 
			handler_id := g_signal_connect_closure (an_object.handle,
													 signal_name.to_external,
													 handle,
													 0 -- i.e. call it before default handler
													 )
			procedure:=a_procedure
		end

		signal_name: STRING is "insert-text"

	procedure: PROCEDURE [ANY, TUPLE [STRING, INTEGER, REFERENCE [INTEGER], GTK_EDITABLE]]
end
