-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ANY_TYPE_MARK
   --
   -- Handling the "ANY" type mark.
   --

inherit
   STATIC_TYPE_MARK
      redefine resolve_in
      end

insert
   NON_GENERIC_TYPE_MARK
      redefine resolve_in
      end

create {ANY}
   make

feature {ANY}
   is_reference: BOOLEAN is True

   is_expanded, is_empty_expanded, is_user_expanded: BOOLEAN is False

   class_text_name: CLASS_NAME

   type: TYPE is
         --|*** TYPE creation can be quite recursive, so this cannot be a once function <FM-14/10/2004>
      do
         Result := smart_eiffel.type_any
      end

   resolve_in (new_type: TYPE): TYPE is
      do
         Result := type
      end

   accept (visitor: ANY_TYPE_MARK_VISITOR) is
      do
         visitor.visit_any_type_mark(Current)
      end

   written_name: HASHED_STRING is
      do
         Result := class_text_name.hashed_name
      end

   id: INTEGER is
      do
         Result := class_text.id
      end

   start_position: POSITION is
      do
         Result := class_text_name.start_position
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_any)
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
      do
         short_printer.put_class_name(class_text_name)
      end

   set_start_position (sp: like start_position) is
      do
         if start_position /= sp then
            class_text_name := class_text_name.twin
            class_text_name.set_accurate_position(sp)
         end
      end

feature {}
   make (sp: like start_position) is
      do
         create class_text_name.make(string_aliaser.hashed_string(as_any), sp)
      ensure
         start_position = sp
      end

end -- class ANY_TYPE_MARK
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
