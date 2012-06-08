-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_ARRAY

inherit
   JSON_TEXT
      redefine
         is_equal, out_in_tagged_out_memory
      end

create {JSON_HANDLER}
   make

feature {ANY}
   accept (visitor: VISITOR) is
      local
         v: JSON_VISITOR
      do
         v ::= visitor
         v.visit_array(Current)
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := array.is_equal(other.array)
      end

   out_in_tagged_out_memory is
      local
         i: INTEGER
      do
         tagged_out_memory.append(once "JSON_ARRAY[")
         from
            i := array.lower
         until
            i > array.upper
         loop
            if i > array.lower then
               tagged_out_memory.append(once ", ")
            end
            array.item(i).out_in_tagged_out_memory
            i := i + 1
         end
         tagged_out_memory.extend(']')
      end

feature {JSON_HANDLER}
   array: TRAVERSABLE[JSON_VALUE]

feature {}
   make (a_array: like array) is
      require
         a_array /= Void
      do
         array := a_array
      ensure
         array = a_array
      end

invariant
   array /= Void

end -- class JSON_ARRAY
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.