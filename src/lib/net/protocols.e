-- See the Copyright notice at the end of this file.
--
expanded class PROTOCOLS
--
-- The PROTOCOL factory. You may register your own protocols here.
--
-- See `register_protocol_factory'
--

feature {ANY}
	register_protocol_factory (a_protocol_name: STRING; a_factory: FUNCTION[TUPLE, PROTOCOL]) is
		require
			a_protocol_name.count > 0
			not known_protocol(a_protocol_name)
		do
			factories.add(a_factory, a_protocol_name.twin)
		ensure
			known_protocol(a_protocol_name)
		end

	known_protocol (a_protocol_name: STRING): BOOLEAN is
		require
			a_protocol_name.count > 0
		do
			init
			Result := factories.has(a_protocol_name)
		end

feature {URL_VALIDITY}
	protocol (a_protocol_name: STRING): PROTOCOL is
		require
			a_protocol_name.count > 0
			known_protocol(a_protocol_name)
		local
			u: RECYCLING_POOL[PROTOCOL]
		do
			init
			u := unused_protocols(a_protocol_name)
			if u.is_empty then
				Result := factories.at(a_protocol_name).item([])
			else
				Result := u.item
			end
		ensure
			not Result.is_connected
		end

feature {}
	factories: DICTIONARY[FUNCTION[TUPLE, PROTOCOL], STRING] is
		once
			create {HASHED_DICTIONARY[FUNCTION[TUPLE, PROTOCOL], STRING]} Result.make
		end

	init is
		once
			register_protocol_factory(once "http", agent new_http(once "http", 80))
			register_protocol_factory(once "https", agent new_http(once "https", 443)) -- that's wrong of course (where is the SSL layer?)
			register_protocol_factory(once "file", agent new_file)
		end

	new_http (name: STRING; port: INTEGER): HTTP_PROTOCOL is
		do
			create Result.make(name, port)
		end

	new_file: FILE_PROTOCOL is
		do
			create Result.make
		end

feature {} -- Protocol reuse
	unused: HASHED_DICTIONARY[RECYCLING_POOL[PROTOCOL], STRING] is
		once
			create Result.make
		end

	unused_protocols (a_protocol_name: STRING): RECYCLING_POOL[PROTOCOL] is
		do
			Result := unused.reference_at(a_protocol_name)
			if Result = Void then
				create Result.make
				unused.add(Result, a_protocol_name.twin)
			end
		ensure
			Result /= Void
		end

feature {URL_VALIDITY}
	recycle (a_protocol: PROTOCOL) is
		require
			not a_protocol.is_connected
		do
			unused_protocols(a_protocol.name).recycle(a_protocol)
		end

end -- class PROTOCOLS
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
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