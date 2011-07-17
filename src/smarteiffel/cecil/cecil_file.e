-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CECIL_FILE
	--
	-- Handle the content of one -cecil file.
	--

inherit
	VISITABLE

insert
	GLOBALS

creation {ANY}
	make

feature {ANY}
	path: STRING
			-- The `path' given after the -cecil flag.

	accept (visitor: CECIL_FILE_VISITOR) is
		do
			visitor.visit_cecil_file(Current)
		end

feature {CECIL_POOL}
	parse is
			-- Parse the corresponding `path' file.
		require
			may_report_an_error: error_handler.is_empty
		local
			c_name: STRING; type_mark: TYPE_MARK; fn: FEATURE_NAME; i: INTEGER; cecil_entry: CECIL_ENTRY
		do
			echo.put_string(once "Parsing Cecil file: ")
			echo.put_string(path)
			echo.put_new_line
			create entries.with_capacity(4)
			path_h := eiffel_parser.connect_to_cecil(path)
			from
			until
				eiffel_parser.end_of_input
			loop
				c_name := eiffel_parser.parse_c_name
				type_mark := eiffel_parser.parse_type_mark
				if not type_mark.is_static then
					error_handler.append("All type marks used in a cecil file have to be static (no anchors).")
					error_handler.add_position(type_mark.start_position)
					error_handler.print_as_fatal_error
				end
				if type_mark.is_agent or else type_mark.is_tuple then
					error_handler.append("Cannot use agents type marks or TUPLE type marks inside cecil %
                                    %files (SmartEiffel limitation, sorry). To work around, just use %
				    %an extra Eiffel routine/object to perform agent or TUPLE %
				    %manipulation in pure Eiffel.")
					error_handler.add_position(type_mark.start_position)
					error_handler.print_as_fatal_error
				end
				fn := eiffel_parser.parse_feature_name
				create cecil_entry.make(c_name, type_mark, fn, eiffel_parser.parse_cecil_is_creation)
				entries.add_last(cecil_entry)
			end
			eiffel_parser.disconnect
			--
			echo.put_string(once "Loading cecil entries:%N")
			from
				i := entries.upper
			until
				i < entries.lower
			loop
				cecil_entry := entries.item(i)
				cecil_entry.get_started(Current)
				i := i - 1
			end
		ensure
			may_report_an_error: error_handler.is_empty
		end

	c_define_users is
		local
			i: INTEGER; cecil_entry: CECIL_ENTRY
		do
			if entries /= Void then
				echo.put_string(once "Cecil (C function for external code) :%N")
				cpp.connect_cecil_out_h(path_h)
				from
					i := entries.upper
				until
					i < entries.lower
				loop
					cecil_entry := entries.item(i)
					cecil_entry.on_echo(Current)
					cecil_entry.c_define_function
					i := i - 1
				end
				cpp.disconnect_cecil_out_h
			end
		end

	collect (type: TYPE) is
		local
			i: INTEGER; dummy: TYPE
		do
			if entries /= Void then
				from
					i := entries.upper
				until
					i < entries.lower
				loop
					dummy := entries.item(i).collect(type)
					i := i - 1
				end
			end
		end

	inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		local
			i: INTEGER
		do
			if entries /= Void then
				from
					i := entries.upper
				until
					i < entries.lower
				loop
					entries.item(i).inline_dynamic_dispatch(code_accumulator, type)
					i := i - 1
				end
			end
		end

feature {}
	path_h: STRING
			-- The name of the include file to be generated (ie. the first information inside file `path)'.

	entries: FAST_ARRAY[CECIL_ENTRY]
			-- List of `entries' parsed from the `path' file.

	make (p: like path) is
		require
			p /= Void
			not string_aliaser.registered_one(p)
		do
			path := p
		ensure
			path = p
		end

end -- class CECIL_FILE
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------