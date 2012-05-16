-- This file is part of Liberty The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EFFECT_GRAMMAR_PRINTER

inherit
   PACKRAT_VISITOR
      redefine
         out_in_tagged_out_memory
      end

insert
   PACKRAT
      redefine
         out_in_tagged_out_memory
      end

create {EFFECT}
   make

feature {ANY}
   out_in_tagged_out_memory is
      do
         if buffer.is_empty then
            table.for_all_atoms(agent accept_atom)
         end
         buffer.out_in_tagged_out_memory
      end

feature {PACKRAT_NON_TERMINAL}
   visit_non_terminal (visited: PACKRAT_NON_TERMINAL) is
      do
         buffer.append(once "%N%"#(1)%", create {PACKRAT_NON_TERMINAL}.make(" # visited.name)
         visited.pattern.accept(Current)
         buffer.append(once ");%N")
      end

feature {PACKRAT_TERMINAL}
   visit_terminal (visited: PACKRAT_TERMINAL) is
      do
         -- not used
      end

feature {PACKRAT_AND}
   visit_and (visited: PACKRAT_AND) is
      do
         buffer.append(once "(")
         visited.primary.accept(Current)
         buffer.append(once ").positive_lookahead")
      end

feature {PACKRAT_CHOICE}
   visit_choice (visited: PACKRAT_CHOICE) is
      local
         i: INTEGER
      do
         from
            i := visited.alternatives.lower
         until
            i > visited.alternatives.upper
         loop
            if i > visited.alternatives.lower then
               buffer.append(once "%N/%N")
            end
            buffer.extend('(')
            visited.alternatives.item(i).accept(Current)
            buffer.extend(')')
            i := i + 1
         end
      end

feature {PACKRAT_NOT}
   visit_not (visited: PACKRAT_NOT) is
      do
         buffer.append(once "(")
         visited.primary.accept(Current)
         buffer.append(once ").negative_lookahead")
      end

feature {PACKRAT_REFERENCE}
   visit_reference (visited: PACKRAT_REFERENCE) is
      do
         buffer.append(once "ref(%"#(1)%")" # visited.name)
      end

feature {PACKRAT_SEQUENCE}
   visit_sequence (visited: PACKRAT_SEQUENCE) is
      local
         i: INTEGER
      do
         buffer.append(once "seq({FAST_ARRAY[PACKRAT_PRIMARY]<<")
         from
            i := visited.primaries.lower
         until
            i > visited.primaries.upper
         loop
            if i > visited.primaries.lower then
               buffer.append(once ", ")
            end
            visited.primaries.item(i).accept(Current)
            i := i + 1
         end
         buffer.append(once ">>}, ")
         inspect
            visited.how_many
         when one then
            buffer.append(once "one")
         when zero_or_more then
            buffer.append(once "zero_or_more")
         when one_or_more then
            buffer.append(once "one_or_more")
         when zero_or_one then
            buffer.append(once "zero_or_one")
         end
         buffer.append(once ", ")
         if visited.tag = Void then
            buffer.append(once "Void, Void")
         else
            buffer.append(once "%"#(1)%", agent reducer.#(1)" # visited.tag)
         end
         buffer.append(once ")")
      end

feature {}
   make (a_table: like table) is
      require
         a_table /= Void
      do
         table := a_table
         buffer := ""
      ensure
         table = a_table
      end

   table: PARSE_TABLE[PACKRAT_PARSE_CONTEXT]
   buffer: STRING

invariant
   table /= Void
   buffer /= Void

end -- class EFFECT_GRAMMAR_PRINTER
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
-- Liberty Eiffel is based on SmartEiffel (Copyrights blow)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------