-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_FEATURE_CONSTANT

inherit
	LIBERTY_FEATURE
		rename
			make as make_late_binding
		redefine
			set_specialized_in
		end

create {LIBERTY_BUILDER_TOOLS}
	make

feature {ANY}
	expression: LIBERTY_EXPRESSION

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_FEATURE_CONSTANT_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_feature_constant(Current)
		end

feature {LIBERTY_FEATURE}
	set_specialized_in (a_original: like Current; a_context: like context) is
		do
			Precursor(a_original, a_context)
			expression := expression.specialized_in(a_context.current_type)
		end

feature {}
	do_join (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			Result := a_feature.joined_constant(a_type, Current, other_fd, current_fd)
		end

feature {LIBERTY_FEATURE}
	joined_attribute (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_ATTRIBUTE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

	joined_constant (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_CONSTANT; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

	joined_deferred (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_DEFERRED; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			Result := Current
		end

	joined_do (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_DO; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

	joined_external (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_EXTERNAL; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

	joined_once (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_ONCE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

	joined_redefined (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_REDEFINED; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			if a_feature.definition_type = definition_type then
				current_fd.fatal_join_error_concrete_redefined(a_type, other_fd)
			end
			Result := Current
		end

	joined_unique (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_UNIQUE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		do
			current_fd.fatal_join_error_concrete_concrete(a_type, other_fd)
		end

feature {}
	make (a_definition_type: like definition_type; a_expression: like expression) is
		require
			a_definition_type /= Void
			a_expression /= Void
		do
			make_late_binding(a_definition_type, Void)
			expression := a_expression
		ensure
			definition_type = a_definition_type
			expression = a_expression
		end

invariant
	expression /= Void

end
