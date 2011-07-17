-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_7

inherit
	RUN_FEATURE
		redefine base_feature
		end

creation {EXTERNAL_PROCEDURE}
	for

feature {ANY}
	base_feature: EXTERNAL_PROCEDURE

	arguments: FORMAL_ARG_LIST

	require_assertion: REQUIRE_ASSERTION

	ensure_assertion: ENSURE_ASSERTION

	local_vars: LOCAL_VAR_LIST

	routine_body: INSTRUCTION

	is_deferred: BOOLEAN is False

	is_static: BOOLEAN is False

	side_effect_free: BOOLEAN is False

	is_once_procedure: BOOLEAN is False

	is_once_function: BOOLEAN is False

	arg_count: INTEGER is
		do
			if arguments /= Void then
				Result := arguments.count
			end
		end

	result_type: TYPE_MARK is
		do
		end

	rescue_compound: INSTRUCTION is
		do
		end

	mapping_c is
		local
			bf: like base_feature; native: NATIVE
		do
			bf := base_feature
			native := bf.native
			if do_needs_c_wrapper(native) then
				default_mapping_procedure
			else
				native.c_mapping_procedure(Current, bf.class_text.name.to_string, bf.first_name.to_string)
			end
		end

	c_define is
		local
			bf: like base_feature; native: NATIVE; bcn: STRING
		do
			bf := base_feature
			native := bf.native
			if do_needs_c_wrapper(native) then
				cpp.prepare_c_function
				define_c_signature
				c_define_opening
				if bf.is_generated_eiffel then
					if routine_body /= Void then
						routine_body.compile_to_c(type_of_current)
					end
				else
					bcn := bf.class_text.name.to_string
					cpp.push_inside_some_wrapper(bf)
					native.c_mapping_procedure(Current, bcn, bf.first_name.to_string)
					cpp.pop
				end
				c_define_closing
				cpp.dump_pending_c_function(True)
			end
		end

feature {NATIVE}
	jvm_opening is
		do
			method_info_start
			jvm_define_opening
		end

	jvm_closing is
		do
			jvm_define_closing
			code_attribute.opcode_return
			method_info.finish
		end

feature {LIVE_TYPE}
	jvm_field_or_method is
		local
			bf: like base_feature; native: NATIVE; bcn: STRING
		do
			bf := base_feature
			native := bf.native
			bcn := bf.class_text.name.to_string
			native.jvm_add_method_for_procedure(Current, bcn, bf.first_name.to_string)
		end

feature {ANY}
	mapping_jvm is
		local
			bf: like base_feature; native: NATIVE; bcn: STRING
		do
			bf := base_feature
			native := bf.native
			bcn := bf.class_text.name.to_string
			native.jvm_mapping_procedure(Current, bcn, bf.first_name.to_string)
		end

feature {JVM}
	jvm_define is
		local
			bf: like base_feature; native: NATIVE; bcn: STRING
		do
			bf := base_feature
			native := bf.native
			bcn := bf.class_text.name.to_string
			native.jvm_define_procedure(Current, bcn, bf.first_name.to_string)
		end

feature {}
	do_adapt is
		local
			class_text: CLASS_TEXT
		do
			class_text := type_of_current.class_text
			-- Adapt the arguments --|*** CAD: need?
			arguments := base_feature.arguments
			if arguments /= Void then
				arguments := arguments.adapt_for(type_of_current)
			end
			-- Adapt the local variables --|*** CAD: need?
			local_vars := base_feature.local_vars
			if local_vars /= Void then
				local_vars := local_vars.adapt_for(type_of_current)
			end
			-- Adapt the routine body:
			routine_body := base_feature.adapt_routine_body_for(type_of_current)
			-- Adapt the assertions:
			if class_text.require_check and then base_feature.require_assertion /= Void then
				require_assertion := base_feature.require_assertion.adapt_for(type_of_current)
			end
			if class_text.ensure_check and then base_feature.ensure_assertion /= Void then
				smart_eiffel.old_list_stack_push
				ensure_assertion := base_feature.ensure_assertion.adapt_for(type_of_current)
				old_list := smart_eiffel.old_list_stack_pop
			end
		end

	set_result_type is
		do
		end

	compute_use_current is
		do
			if base_feature.use_current(type_of_current) then
				use_current_state := True_state
			else
				std_compute_use_current
			end
		end

	update_tmp_jvm_descriptor is
		do
			routine_update_tmp_jvm_descriptor
		end

	do_needs_c_wrapper (native: NATIVE): BOOLEAN is
		do
			if base_feature.is_generated_eiffel then
				Result := True
			elseif native.do_needs_c_wrapper(type_of_current, base_feature.first_name.to_string) then
				Result := True
			elseif require_assertion /= Void then
				Result := True
			elseif ensure_assertion /= Void then
				Result := True
			end
		end
	
end -- class RUN_FEATURE_7
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