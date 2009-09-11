-- See the Copyright notice at the end of this file.
--
class NCURSES_LABEL
	-- This class adds a label widget.

inherit
	NCURSES_WINDOW
		rename make as make_window
		redefine left, top, width, height, refresh_later
		end

creation{ANY}
	make

feature{ANY}
	left: INTEGER

	top: INTEGER

	width: INTEGER

	height: INTEGER

	text: STRING

	refresh_later is
		do
			put_string_at(text, (width - text.count) // 2, (height - 1) // 2)
			Precursor
		end

	set_text (t: like text) is
		do
			if t.count + 1 > width then
				text := t.substring(1, width - 1)
			else
				text := t
			end
		end

feature{}
	make (p: like parent; t: like text; x, y, w, h: INTEGER) is
		require
			p /= Void
			t /= Void
		do
			left := x
			top := y
			width := w
			height := h
			set_text(t)
			set_parent(p)
			make_sub_window(p.get_window, left, top, width, height)
		end

invariant
	parent /= Void

end -- class NCURSES_LABEL
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN, Pierre-Nicolas CLAUSS
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------