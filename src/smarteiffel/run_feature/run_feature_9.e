-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_9

inherit
	RUN_FEATURE
		redefine base_feature
		end

creation {DEFERRED_ROUTINE}
	for

feature {ANY}
	base_feature: DEFERRED_ROUTINE

	arguments: FORMAL_ARG_LIST

	result_type: TYPE_MARK

	require_assertion: REQUIRE_ASSERTION

	ensure_assertion: ENSURE_ASSERTION

	is_deferred: BOOLEAN is True

	side_effect_free: BOOLEAN is False

	is_once_procedure: BOOLEAN is False

	is_once_function: BOOLEAN is False

	routine_body: INSTRUCTION is
		do
		end

	rescue_compound: INSTRUCTION is
		do
		end

	mapping_c is
		do
			if ace.no_check then
				if result_type = Void then
					default_mapping_procedure
				else
					default_mapping_function
				end
			elseif result_type /= Void then
				result_type.c_initialize_in(cpp.pending_c_function_body)
			end
		end

	c_define is
		local
			msg: STRING
		do
			if ace.relax then
				-- The deferred feature warning will be made later if the feature is actually in the live code.
				error_handler.append("Feature %"")
				error_handler.append(name.to_string)
				error_handler.append("%" is deferred in type ")
				error_handler.append(type_of_current.name.to_string)
				error_handler.append(". This type should be marked as deferred.")
				error_handler.print_as_warning
			end
			define_c_signature
			error_handler.add_position(start_position)
			error_handler.append("This routine is actually deferred is still in the live code set. %
										%(You will have a crash at run-time if the dynamic type of Current is ")
			error_handler.append(type_of_current.name.to_string)
			error_handler.append(".)")
			error_handler.print_as_warning
			cpp.prepare_c_function
			c_define_opening
			msg := "Deferred {"
			msg.append(type_of_current.name.to_string)
			msg.append(once "}.")
			msg.append(name.to_string)
			msg.append(once " called.")
			cpp.put_error0(msg)
			c_define_closing
			cpp.dump_pending_c_function(True)
		end

	local_vars: LOCAL_VAR_LIST is
		do
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
		local
			rt: TYPE_MARK
		do
			-- Adapt the result type:
			rt := base_feature.result_type
			if rt /= Void then
				result_type := rt.resolve_in(type_of_current).canonical_type_mark --|*** CAD: need of resolve_in?
			end
		ensure
			base_feature.result_type /= Void implies result_type /= Void
		end

	compute_use_current is
		do
			use_current_state := True_state
		end

feature {LIVE_TYPE}
	jvm_field_or_method is
		do
		end

feature {ANY}
	mapping_jvm is
		do
		end

feature {JVM}
	jvm_define is
		do
		end

feature {}
	update_tmp_jvm_descriptor is
		do
			routine_update_tmp_jvm_descriptor
		end

end -- class RUN_FEATURE_9
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