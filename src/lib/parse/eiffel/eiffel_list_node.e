-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright(C) 2006-2009: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
deferred class EIFFEL_LIST_NODE

inherit
	EIFFEL_NODE

insert
	TRAVERSABLE[EIFFEL_NODE]

feature {ANY}
	item (i: INTEGER): EIFFEL_NODE is
		require
			valid_index(i)
		deferred
		end

	valid_index (index: INTEGER): BOOLEAN is
		deferred
		ensure
			definition: Result = index >= lower and then index <= upper
		end

	lower: INTEGER is
		deferred
		ensure
			lower >= 0
		end

	upper: INTEGER is
		deferred
		ensure
			upper >= lower - 1
		end

	count: INTEGER is
		deferred
		ensure
			definition: Result = upper - lower + 1
		end

	first: EIFFEL_NODE is
		require
			not is_empty
		deferred
		ensure
			definition: Result = item(lower)
		end

	last: EIFFEL_NODE is
		require
			not is_empty
		deferred
		ensure
			definition: Result = item(upper)
		end

	frozen get_new_iterator: ITERATOR[EIFFEL_NODE] is
		do
			check
				dont_use_this: False
			end
		end

	is_empty: BOOLEAN is
		deferred
		ensure
			definition: Result = (count = 0)
		end

feature {EIFFEL_GRAMMAR}
	add (a_child: like item) is
		deferred
		ensure
			count = old count + 1
			last = a_child
		end

end -- class EIFFEL_LIST_NODE