indexing
	description: "Curl htt post"
	copyright: "[
					Author: Natalia B. Bidart
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except)
					
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

class CURL_HTTP_POST

inherit
	C_STRUCT redefine free end

insert
	CURL_HTTP_POST_EXTERNALS

creation
	make, null--, from_external_pointer

feature -- Size

	struct_size: INTEGER is
		external "C inline use <curl/curl.h>"
		alias "sizeof (struct curl_httppost)"
		end

feature {} -- Creation

	make is
		do
			allocate
			null
		end

	null is
		do
			create last_item.make
			error_code := 0
		end

feature {} -- Destruction

	free (a_ptr: POINTER) is
			-- `free' is used to clean up data previously
			-- built/appended with curl_formadd(3). This must be called
			-- when the data has been used, which typically means after the
			-- curl_easy_perform(3) has been called.
		do
			curl_formfree (a_ptr)
		end

feature {} -- Representation

	last_item: CURL_HTTP_POST

feature -- Representation

	is_valid: BOOLEAN is
		do
			Result:= error_code = 0
		end

	error_code: INTEGER

feature

	set_name_and_content (name, content: STRING) is
		require
			name /= Void
			content /= Void
		do
			-- `to_external' from STRING is adding the null character at
			-- the end of each string
			error_code := curl_formadd ($handle, $last_item,
			                            curl_form_copy_name, name.to_external,
			                            curl_form_copy_contents, content.to_external,
			                            curl_form_end)
		end

	set_name_and_file (name, file: STRING) is
		require
			name /= Void
			file /= Void
		do
			error_code := curl_formadd ($handle, $last_item,
			                            curl_form_copy_name, name.to_external,
			                            curl_form_file, file.to_external,
			                            curl_form_end)
		end

invariant
	last_item /= Void
	error_code = 0 or else is_valid_curl_form_add (error_code)

end -- class CURL_HTTP_POST
