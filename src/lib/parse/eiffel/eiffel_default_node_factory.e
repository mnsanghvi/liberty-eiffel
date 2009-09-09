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
class EIFFEL_DEFAULT_NODE_FACTORY

inherit
	EIFFEL_NODE_FACTORY

create {ANY}
	make

feature {EIFFEL_GRAMMAR}
	list (name: STRING): EIFFEL_LIST_NODE is
		do
			create {EIFFEL_LIST_NODE_IMPL}Result.make(name)
		end

	non_terminal (name: STRING; names: TRAVERSABLE[STRING]): EIFFEL_NON_TERMINAL_NODE is
		do
			create {EIFFEL_NON_TERMINAL_NODE_IMPL}Result.make(name, names)
		end

	terminal (name: STRING; image: EIFFEL_IMAGE): EIFFEL_TERMINAL_NODE is
		do
			create {EIFFEL_TERMINAL_NODE_IMPL}Result.make(name, image)
		end

feature {}
	make is
		do
		end

end -- class EIFFEL_DEFAULT_NODE_FACTORY