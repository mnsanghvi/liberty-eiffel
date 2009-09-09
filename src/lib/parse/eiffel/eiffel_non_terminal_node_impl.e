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
class EIFFEL_NON_TERMINAL_NODE_IMPL

inherit
	EIFFEL_NON_TERMINAL_NODE

creation {EIFFEL_NODE_FACTORY}
	make

feature {ANY}
	name: STRING

	accept (visitor: VISITOR) is
		local
			v: EIFFEL_NON_TERMINAL_NODE_IMPL_VISITOR
		do
			v ::= visitor
			v.visit_eiffel_non_terminal_node_impl(Current)
		end

	name_at (index: INTEGER): STRING is
		require
			valid_index(index)
		do
			Result := names.item(index - lower + names.lower)
		end

	node_at (index: INTEGER): EIFFEL_NODE is
		require
			valid_index(index)
		do
			Result := nodes.item(index)
		end

	valid_index (index: INTEGER): BOOLEAN is
		do
			Result := nodes.valid_index(index)
		end

	lower: INTEGER is
		do
			Result := nodes.lower
		end

	upper: INTEGER is
		do
			Result := nodes.upper
		end

	count: INTEGER is
		do
			Result := nodes.count
		end

	is_empty: BOOLEAN is
		do
			Result := nodes.is_empty
		end

feature {EIFFEL_GRAMMAR}
	set (index: INTEGER; node: EIFFEL_NODE) is
		require
			valid_index(index)
		do
			nodes.put(node, index)
			node.set_parent(Current)
		ensure
			node_at(index) = node
		end

feature {EIFFEL_NODE_HANDLER}
	display (output: OUTPUT_STREAM; indent: INTEGER; p: STRING) is
		local
			i: INTEGER
		do
			do_indent(output, indent, p)
			output.put_character('"')
			output.put_string(name)
			output.put_line(once "%":")
			from
				i := lower
			until
				i > upper
			loop
				node_at(i).display(output, indent + 1, " * ")
				i := i + 1
			end
		end

	generate (o: OUTPUT_STREAM) is
		local
			i: INTEGER
		do
			from
				i := lower
			until
				i > upper
			loop
				node_at(i).generate(o)
				i := i + 1
			end
			generate_forgotten(o)
		end

feature {}
	make (a_name: like name; a_names: TRAVERSABLE[STRING]) is
		do
			name := a_name
			names := a_names
			create nodes.make(a_names.count)
		ensure
			name = a_name
			names = a_names
		end

	names: TRAVERSABLE[STRING]

	nodes: FAST_ARRAY[EIFFEL_NODE]

invariant
	names.count = nodes.count

end -- class EIFFEL_NON_TERMINAL_NODE_IMPL