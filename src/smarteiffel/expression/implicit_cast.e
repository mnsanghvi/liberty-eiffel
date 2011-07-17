-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class IMPLICIT_CAST
	--
	-- To memorize an implicit legal conversion from one type to another. This invisible expression is 
	-- used for all kinds of legal implicit conversions:
	--
	--   from INTEGER_8 to INTEGER_16
	--   from INTEGER_8 to INTEGER_32,
	--   from INTEGER_8 to INTEGER_64,
	--
	--   from INTEGER_16 to INTEGER_32,
	--   from INTEGER_16 to INTEGER_64,
	--
	--   from INTEGER_32 to INTEGER_64,
	--   
	--   from REAL_32 to REAL_64,
	--   from REAL_32 to REAL_80,
	--   from REAL_32 to REAL_128,
	--   from REAL_32 to REAL_EXTENDED,
	--
	-- (See also NO_DISPATCH.)
	-- 

inherit
	EXPRESSION

creation {ASSIGNMENT_HANDLER, IMPLICIT_CAST}
	make

feature {ANY}
	resolved_memory: TYPE
			-- The final type of Current.

	expression: EXPRESSION
			-- The wrapped `expression'.

	expression_type: TYPE
			-- The original one at the creation of this IMPLICIT_CAST.

	start_position: POSITION is
		do
			Result := expression.start_position
		end

	is_manifest_string: BOOLEAN is
		do
			Result := expression.is_manifest_string
		end

	extra_bracket_flag: BOOLEAN is
		do
			Result := expression.extra_bracket_flag
		end

	resolve_in (type: TYPE): TYPE is
		do
			Result := resolved_memory
		end

	is_void: BOOLEAN is
		do
			Result := expression.is_void
		end

	declaration_type: TYPE is
		do
			Result := resolved_memory
		end

	is_writable: BOOLEAN is
		do
			Result := expression.is_writable
		end

	is_result: BOOLEAN is
		do
			Result := expression.is_result
		end

	is_implicit_current, is_current: BOOLEAN is
		do
			-- (Even if expression is a `Current', we must not forget this IMPLICIT_CAST.)
		end

	is_static: BOOLEAN is
		do
			Result := expression.is_static
		end

	compile_to_c (type: TYPE) is
		do
			cpp.pending_c_function_body.append(once "/*IC*/(")
			resolved_memory.canonical_type_mark.c_type_for_target_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ")(")
			expression.mapping_c_target(type, expression_type)
         cpp.pending_c_function_body.extend(')')
		end

	mapping_c_target (type, target_formal_type: TYPE) is
		do
			compile_to_c(type)
		end

	mapping_c_arg (type: TYPE) is
		do
			compile_to_c(type)
		end

	safety_check (type: TYPE) is
		do
			expression.safety_check(type)
		end

	compile_to_jvm, compile_target_to_jvm (type: TYPE) is
		do
			expression.compile_target_to_jvm(type)
			jvm.kernel_expanded_convert(expression_type, resolved_memory)
		end

	jvm_branch_if_false (type: TYPE): INTEGER is
		do
			Result := expression.jvm_branch_if_false(type)
		end

	jvm_branch_if_true (type: TYPE): INTEGER is
		do
			Result := expression.jvm_branch_if_true(type)
		end

	use_current (type: TYPE): BOOLEAN is
		do
			Result := expression.use_current(type)
		end

	side_effect_free (type: TYPE): BOOLEAN is
		do
			Result := expression.side_effect_free(type)
		end

	specialize_in (new_type: TYPE): like Current is
		do
			check
				False -- (IMPLICIT_CAST are not written.)
			end
		end

	specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
		local
			e: like expression; implicit_cast: IMPLICIT_CAST
		do
			-- To avoid nested IMPLICIT_CAST:
			if implicit_cast ?:= expression then
            implicit_cast ::= expression
				e := implicit_cast.expression.specialize_thru(parent_type, parent_edge, new_type)
			else
				e := expression.specialize_thru(parent_type, parent_edge, new_type)
			end
			if e = expression then
				Result := Current
			else
				Result := twin
				Result.set_expression(e)
			end
		end

	specialize_2 (type: TYPE): EXPRESSION is
		local
			e: like expression
		do
			e := expression.specialize_2(type)
			if type.is_integer then
				-- Because INTEGER_GENERAL is a very special case, we have to unwrap the IMPLICIT_CAST 
				-- in order to give another chance for expression to match with INTEGER_8 / 16 / 32 / 64:
				Result := e
			elseif e = expression then
				Result := Current
			else
				create {IMPLICIT_CAST} Result.make(e, e.resolve_in(type), resolved_memory)
			end
		end

	has_been_specialized: BOOLEAN is
		do
			Result := expression.has_been_specialized
		end

	collect (type: TYPE): TYPE is
		do
			Result := expression.collect(type)
			Result := resolved_memory
		end

	adapt_for (type: TYPE): like Current is
		local
			e: like expression
		do
			e := expression.adapt_for(type)
			if e = expression then
				Result := Current
			else
				Result := twin
				Result.set_expression(e)
			end
		end

	non_void_no_dispatch_type (type: TYPE): TYPE is
		do
			--|*** To be done. *** (Dom. june 18th 2004) ***
		end

	simplify (type: TYPE): EXPRESSION is
		local
			e: like expression; ic: INTEGER_CONSTANT; rc: REAL_CONSTANT; et: like expression_type
		do
			-- Going back to the INTEGER_CONSTANT canonical form:
			if (ic ?:= expression) and then resolved_memory.is_integer then
            ic ::= expression
				smart_eiffel.magic_count_increment
				ic := ic.twin
				ic.set_result_type(resolved_memory.canonical_type_mark)
				Result := ic
			end
			-- Going back to the REAL_CONSTANT canonical form:
			if Result = Void then
				if (rc ?:= expression) and then resolved_memory.is_real then
               rc ::= expression
					smart_eiffel.magic_count_increment
					rc := rc.twin
					rc.set_result_type(resolved_memory.canonical_type_mark)
					Result := rc
				end
			end
			-- Finally, the general scheme:
			if Result = Void then
				e := expression.simplify(type)
				et := e.resolve_in(type)
				check e = expression implies et = expression_type end
				if e = expression then
					Result := Current
				else
					create {IMPLICIT_CAST} Result.make(e, et, resolved_memory)
				end
			end
		end

	accept (visitor: IMPLICIT_CAST_VISITOR) is
		do
			visitor.visit_implicit_cast(Current)
		end

	pretty (indent_level: INTEGER) is
		do
			expression.pretty(indent_level)
		end

	bracketed_pretty (indent_level: INTEGER) is
		do
			expression.bracketed_pretty(indent_level)
		end

	pretty_target (indent_level: INTEGER) is
		do
			expression.pretty_target(indent_level)
		end

	short (type: TYPE) is
		do
			expression.short(type)
		end

	short_target (type: TYPE) is
		do
			expression.short_target(type)
		end

	precedence: INTEGER is
		do
			Result := expression.precedence
		end

	jvm_assign_creation (type: TYPE) is
		do
			expression.jvm_assign_creation(type)
		end

	jvm_assign (type: TYPE) is
		do
			expression.jvm_assign(type)
		end

feature {IMPLICIT_CAST}
	set_expression (e: like expression) is
		do
			expression := e
		end

feature {CODE, EFFECTIVE_ARG_LIST}
	inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		local
			e: like expression; implicit_cast: like Current
		do
			expression.inline_dynamic_dispatch_(code_accumulator, type)
			e := code_accumulator.current_context.last.to_expression
			code_accumulator.current_context.remove_last
			if e = expression then
				code_accumulator.current_context.add_last(Current)
			else
				implicit_cast := twin
				implicit_cast.set_expression(e)
				code_accumulator.current_context.add_last(implicit_cast)
			end
		end
	
feature {}
	make (e: like expression; et: like expression_type; rm: like resolved_memory) is
		require
			no_implicit_cast_of_implicit_cast: not e.generating_type.is_equal(once "IMPLICIT_CAST")
			at_least_one_expanded: et.is_expanded or rm.is_expanded
			valid_assignment: et.can_be_assigned_to(rm)
		do
			resolved_memory := rm
			expression := e
			expression_type := et
		ensure
			expression /= Void
			expression_type = et
			resolved_memory = rm
		end

	canonical_form: BOOLEAN is
		do
			Result := not ({IMPLICIT_CAST} ?:= expression)
		ensure
			assertion_check_only: Result
		end

invariant
	resolved_memory /= Void

	expression /= Void

	expression_type /= Void

	canonical_form

end -- class IMPLICIT_CAST
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