-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class INSPECT_STATEMENT
   --
   -- The parent of MANIFEST_STRING_INSPECT_STATEMENT and OTHER_INSPECT_STATEMENT.
   -- Thanks to the syntactical information, the `eiffel_parser' is able to create
   -- MANIFEST_STRING_INSPECT_STATEMENT objects as soon as some manifest STRING is used
   -- inside "when" clauses. Actually, as soon as there is one manifest STRING somewhere,
   -- all "when" clauses must use only manifest STRINGs!
   -- Thus, except for the weird case of an "inspect" statement without "when" clause at all,
   -- all other created object, OTHER_INSPECT_STATEMENT objects, inspects INTEGER
   -- or CHARACTER expressions.
   --
   -- Note: all values used inside when clauses are always static.
   --

inherit
   INSTRUCTION

feature {ANY}
   start_position: POSITION
         -- Of keyword `inspect'.

   expression: EXPRESSION
         -- Heading expression after keyword `inspect'.

   when_list: FAST_ARRAY[WHEN_CLAUSE]
         -- List of when clauses.

   else_position: POSITION
         -- Of the keyword `else' if any.

   else_compound: INSTRUCTION
         -- Else compound if any.

   end_mark_comment: BOOLEAN is True

   dynamic_dispatch_flag: BOOLEAN is
         -- Indicate that the intent of `Current' is to implement dynamic dispatch.
      deferred
      end

   manifest_string_inspector: MANIFEST_STRING_INSPECTOR
         -- Non Void if manifest strings are used. Some extra code is generated by this object.

   simplify (type: TYPE): INSTRUCTION is
      local
         exp: like expression; wl: like when_list; ec: like else_compound; i, i1, i2: INTEGER; wc1, wc2: WHEN_CLAUSE
         cc: CHARACTER_CONSTANT; ic: INTEGER_CONSTANT; selected: BOOLEAN; value: INTEGER
      do
         if manifest_string_inspector /= Void then
            Result := manifest_string_inspector.simplify(type, Current)
         else
            exp := expression.simplify(type)
            cc ?= exp
            ic ?= exp
            if cc /= Void or else ic /= Void then
               -- The `expression' is statically known:
               if cc /= Void then
                  value := cc.value.code
               else
                  value := ic.value_memory.to_integer_32
               end
               smart_eiffel.magic_count_increment
               if when_list = Void then
                  Result := else_compound
               else
                  from
                     i := when_list.lower
                  until
                     selected or else i > when_list.upper
                  loop
                     wc1 := when_list.item(i)
                     if wc1.match_value(value) then
                        selected := True
                        Result := wc1.compound
                     end
                     i := i + 1
                  end
                  if not selected then
                     if else_position.is_unknown then
                        error_handler.append(once "In the context %"")
                        error_handler.append(type.name.to_string)
                        error_handler.append(once "%" (i.e. when the type of Current is %"")
                        error_handler.append(type.name.to_string)
                        error_handler.append(once "%") this expression is the ")
                        if cc /= Void then
                           error_handler.append(once "CHARACTER ")
                           error_handler.append(cc.to_string)
                        else
                           error_handler.append(once "INTEGER ")
                           error_handler.append(ic.to_string)
                        end
                        error_handler.append(once " but there is _no_ when clause selected. (Also note that there is %
                    %no else part for this inspect statment, hence this error message.)")
                        error_handler.add_position(expression.start_position)
                        error_handler.print_as_fatal_error
                     end
                     Result := else_compound
                  end
               end
               if Result /= Void then
                  Result := Result.simplify(type)
               end
            else
               -- The general scheme:
               if when_list /= Void then
                  from
                     i := when_list.lower
                  until
                     wc1 /= wc2 or else i > when_list.upper
                  loop
                     wc1 := when_list.item(i)
                     wc2 := wc1.simplify(type)
                     i := i + 1
                  end
                  if wc1 = wc2 then
                     wl := when_list
                  else
                     from
                        wl := when_list.twin
                        wl.put(wc2, i - 1)
                     until
                        i > wl.upper
                     loop
                        wl.put(wl.item(i).simplify(type), i)
                        i := i + 1
                     end
                  end
               end
               if else_compound /= Void then
                  ec := else_compound.simplify(type)
               end
               if wl = Void then
                  if exp.side_effect_free(type) then
                     Result := ec
                  else
                     Result := current_or_twin_init(exp, wl, ec)
                  end
               else
                  -- Trying to merge similar when clauses:
                  from
                     i1 := wl.upper
                  until
                     i1 <= wl.lower
                  loop
                     from
                        i2 := i1 - 1
                     until
                        i2 < wl.lower
                     loop
                        if same_compound(type, wl.item(i1).compound, wl.item(i2).compound) then
                           smart_eiffel.inspect_when_merge_counter_increment
                           if wl = when_list then
                              wl := wl.twin
                           end
                           -- Moving `i1' into `i2':
                           wl.put(wl.item(i2).create_merged_with(wl.item(i1)), i2)
                           wl.remove(i1)
                           -- Now resetting indices:
                           i1 := i1 - 1
                           i2 := i1 - 1
                        else
                           i2 := i2 - 1
                        end
                     end
                     i1 := i1 - 1
                  end
                  if wl.count = 1 then
                     if else_position.is_unknown and then ace.boost then
                        if exp.side_effect_free(type) then
                           Result := wl.first.compound
                        else
                           Result := current_or_twin_init(exp, Void, wl.first.compound)
                        end
                     else
                        Result := current_or_twin_init(exp, wl, ec)
                     end
                  else
                     Result := current_or_twin_init(exp, wl, ec)
                  end
               end
            end
         end
      end

   frozen side_effect_free (type: TYPE): BOOLEAN is
      local
         i: INTEGER
      do
         if expression.side_effect_free(type) then
            from
               if else_position.is_unknown then
                  Result := True
               else
                  Result := else_compound.side_effect_free(type)
               end
               i := when_list.lower
            until
               not Result or else i > when_list.upper
            loop
               Result := when_list.item(i).side_effect_free(type)
               i := i + 1
            end
         end
      end

   frozen use_current (type: TYPE): BOOLEAN is
      local
         i: INTEGER
      do
         Result := expression.use_current(type)
         if not Result and then when_list /= Void then
            from
               i := when_list.lower
            until
               Result or else i > when_list.upper
            loop
               Result := when_list.item(i).use_current(type)
               i := i + 1
            end
         end
         if else_compound /= Void then
            Result := Result or else else_compound.use_current(type)
         end
      end

   frozen specialize_in (new_type: TYPE): like Current is
      local
         exp: like expression; wl: like when_list; ec: like else_compound; i: INTEGER; ew1, ew2: WHEN_CLAUSE
      do
         exp := expression.specialize_in(new_type)
         if when_list /= Void then
            from
               i := when_list.lower
            until
               ew1 /= ew2 or else i > when_list.upper
            loop
               ew1 := when_list.item(i)
               ew2 := ew1.specialize_in(new_type)
               i := i + 1
            end
            if ew1 = ew2 then
               wl := when_list
            else
               from
                  wl := when_list.twin
                  wl.put(ew2, i - 1)
               until
                  i > wl.upper
               loop
                  wl.put(when_list.item(i).specialize_in(new_type), i)
                  i := i + 1
               end
            end
         end
         if else_compound /= Void then
            ec := else_compound.specialize_in(new_type)
         end
         Result := current_or_twin_init(exp, wl, ec)
      end

   frozen specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         exp: like expression; wl: like when_list; ec: like else_compound; i: INTEGER; ew1, ew2: WHEN_CLAUSE
      do
         exp := expression.specialize_thru(parent_type, parent_edge, new_type)
         if when_list /= Void then
            from
               i := when_list.lower
            until
               ew1 /= ew2 or else i > when_list.upper
            loop
               ew1 := when_list.item(i)
               ew2 := ew1.specialize_thru(parent_type, parent_edge, new_type)
               i := i + 1
            end
            if ew1 = ew2 then
               wl := when_list
            else
               from
                  wl := when_list.twin
                  wl.put(ew2, i - 1)
               until
                  i > wl.upper
               loop
                  wl.put(when_list.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
                  i := i + 1
               end
            end
         end
         if else_compound /= Void then
            ec := else_compound.specialize_thru(parent_type, parent_edge, new_type)
         end
         Result := current_or_twin_init(exp, wl, ec)
      end

   specialize_and_check (type: TYPE): like Current is
      local
         exp: like expression; expression_type: TYPE; wl: like when_list
         ec: like else_compound; i: INTEGER; ew1, ew2: WHEN_CLAUSE
      do
         exp := expression.specialize_and_check(type)
         expression_type := exp.declaration_type
         if when_list /= Void then
            if expression_type.is_character then
               from
                  i := when_list.lower
               until
                  ew1 /= ew2 or else i > when_list.upper
               loop
                  ew1 := when_list.item(i)
                  ew2 := ew1.specialize_and_check_character(type)
                  i := i + 1
               end
               if ew1 = ew2 then
                  wl := when_list
               else
                  from
                     wl := when_list.twin
                     wl.put(ew2, i - 1)
                  until
                     i > wl.upper
                  loop
                     wl.put(when_list.item(i).specialize_and_check_character(type), i)
                     i := i + 1
                  end
               end
            elseif expression_type.is_integer then
               from
                  i := when_list.lower
               until
                  ew1 /= ew2 or else i > when_list.upper
               loop
                  ew1 := when_list.item(i)
                  ew2 := ew1.specialize_and_check_integer(type)
                  i := i + 1
               end
               if ew1 = ew2 then
                  wl := when_list
               else
                  from
                     wl := when_list.twin
                     wl.put(ew2, i - 1)
                  until
                     i > wl.upper
                  loop
                     wl.put(when_list.item(i).specialize_and_check_integer(type), i)
                     i := i + 1
                  end
               end
            elseif expression_type.is_string or else expression_type.is_fixed_string then
               create manifest_string_inspector.make(Current)
               from
                  i := when_list.lower
               until
                  ew1 /= ew2 or else i > when_list.upper
               loop
                  ew1 := when_list.item(i)
                  ew2 := ew1.specialize_and_check_string(type)
                  i := i + 1
               end
               if ew1 = ew2 then
                  wl := when_list
               else
                  from
                     wl := when_list.twin
                     wl.put(ew2, i - 1)
                  until
                     i > wl.upper
                  loop
                     wl.put(when_list.item(i).specialize_and_check_string(type), i)
                     i := i + 1
                  end
               end
            else
               error_handler.add_position(expression.start_position)
               error_handler.append(once "For inspect statement, the expression type can be only INTEGER, %
                                         %CHARACTER, STRING, or FIXED_STRING. (Actually ")
               error_handler.add_expression(expression)
               error_handler.append(once " is of type ")
               error_handler.add_type(expression_type)
               error_handler.append(once " which is not allowed.)")
               error_handler.print_as_error
            end
         end
         if else_compound /= Void then
            ec := else_compound.specialize_and_check(type)
         end
         Result := current_or_twin_init(exp, wl, ec)
         Result.validity_check(type, expression_type)
      end

   frozen safety_check (type: TYPE) is
      local
         i: INTEGER
      do
         expression.safety_check(type)
         if when_list /= Void then
            from
               i := when_list.lower
            until
               i > when_list.upper
            loop
               when_list.item(i).safety_check(type)
               i := i + 1
            end
         end
         if else_compound /= Void then
            else_compound.safety_check(type)
         end
      end

   has_been_specialized: BOOLEAN is
      local
         i: INTEGER
      do
         Result := expression.has_been_specialized
         if Result and then when_list /= Void then
            from
               i := when_list.lower
               Result := True
            until
               not Result or else i > when_list.upper
            loop
               Result := when_list.item(i).has_been_specialized
               i := i + 1
            end
         end
         if Result and then else_compound /= Void then
            Result := else_compound.has_been_specialized
         end
      end

   pretty (indent_level: INTEGER) is
      local
         i: INTEGER
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.put_string(once "inspect")
         pretty_printer.set_indent_level(indent_level + 1)
         pretty_printer.set_semi_colon_flag(False)
         expression.pretty(indent_level + 1)
         pretty_printer.set_indent_level(0)
         if when_list /= Void then
            from
               i := when_list.lower
            until
               i > when_list.upper
            loop
               when_list.item(i).pretty(indent_level)
               i := i + 1
            end
            pretty_printer.set_indent_level(0)
         end
         if else_compound = Void then
            if not else_position.is_unknown then
               pretty_printer.set_indent_level(indent_level)
               pretty_printer.put_string(once "else")
               pretty_printer.set_indent_level(0)
            end
         else
            pretty_printer.set_indent_level(indent_level)
            pretty_printer.put_string(once "else")
            else_compound.pretty(indent_level + 1)
         end
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.keyword(once "end")
         if pretty_printer.print_end_of_statement then
            pretty_printer.put_end_of(once "inspect")
         end
      end

   collect (type: TYPE): TYPE is
      local
         i: INTEGER; dummy: TYPE; condition_live_type: LIVE_TYPE; when_clause: WHEN_CLAUSE
      do
         dummy := expression.collect(type)
         if when_list /= Void then
            if condition_type /= Void then
               condition_live_type := condition_type.live_type
            end
            from
               i := when_list.lower
            until
               i > when_list.upper
            loop
               when_clause := when_list.item(i)
               when_clause.set_condition_live_type(condition_live_type)
               dummy := when_clause.collect(type)
               i := i + 1
            end
         end
         if else_compound /= Void then
            dummy := else_compound.collect(type)
         end
      end

   adapt_for (type: TYPE): like Current is
      local
         exp: like expression; wl: like when_list; ew1, ew2: WHEN_CLAUSE; ec: like else_compound
         source_index, destination_index: INTEGER
      do
         exp := expression.adapt_for(type)
         if when_list /= Void then
            from
               source_index := when_list.lower
               check
                  source_index = 0
               end
            until
               source_index > when_list.upper or else ew1 /= ew2
            loop
               ew1 := when_list.item(source_index)
               source_index := source_index + 1
               ew2 := ew1.strip_or_set_value(source_index, type, condition_type)
               if ew2 /= Void then
                  ew2 := ew2.adapt_for(type)
               end
            end
            if ew1 = ew2 then
               wl := when_list
            else
               wl := when_list.twin
               if ew2 /= Void then
                  wl.put(ew2, source_index - 1)
                  destination_index := source_index
               else
                  destination_index := source_index - 1
               end
               from
               until
                  source_index > wl.upper
               loop
                  ew1 := wl.item(source_index)
                  ew2 := ew1.strip_or_set_value(destination_index + 1, type, condition_type)
                  if ew2 /= Void then
                     ew2 := ew2.adapt_for(type)
                     wl.put(ew2, destination_index)
                     destination_index := destination_index + 1
                  end
                  source_index := source_index + 1
               end
               if destination_index = wl.lower then
                  wl := Void
               elseif destination_index < wl.upper + 1 then
                  wl.remove_tail(wl.upper - destination_index + 1)
               end
            end
         end
         if else_compound /= Void then
            ec := else_compound.adapt_for(type)
         end
         Result := current_or_twin_init(exp, wl, ec)
         Result.compute_values(type)
      end

feature {WHEN_CLAUSE}
   always_selected (compound: INSTRUCTION) is
      do
         else_compound := compound
         when_list := Void
      end

feature {EIFFEL_PARSER, CODE, MANIFEST_STRING_INSPECTOR, INTROSPECTION_HANDLER}
   set_else_compound (sp: like else_position; ec: like else_compound) is
      do
         else_position := sp
         else_compound := ec
      end

feature {WHEN_CLAUSE}
   add_when (when_clause: WHEN_CLAUSE) is
      require
         when_clause /= Void
      do
         if when_list = Void then
            create when_list.with_capacity(4)
         end
         when_list.add_last(when_clause)
      end

feature {INSPECT_STATEMENT, WHEN_CLAUSE}
   condition_type: TYPE
         -- ??? VIRER OU BIEN EXPLIQUER A QUOI CELA SERT ???
         -- *** DOM April 23th 2008 ***

feature {INSPECT_STATEMENT, EXTERNAL_ROUTINE}
   init (exp: like expression; wl: like when_list; ec: like else_compound) is
      require
         exp /= Void
         ec /= Void implies not else_position.is_unknown
      do
         expression := exp
         else_compound := ec
         when_list := wl
         if when_list = Void then
            manifest_string_inspector := Void
         end
      ensure
         expression = exp
         when_list = wl
         else_compound = ec
      end

feature {MANIFEST_STRING_INSPECTOR}
   is_empty_call (type: TYPE; e_local: EXPRESSION): FUNCTION_CALL_0 is
      local
         fn_is_empty: FEATURE_NAME
      do
         create fn_is_empty.ordinary_name(is_empty_name, start_position)
         create Result.make_specialized(e_local, e_local.resolve_in(type), fn_is_empty)
      end

   item_call (type: TYPE; e_local: EXPRESSION): FUNCTION_CALL_1 is
      local
         fn_item: FEATURE_NAME; args: EFFECTIVE_ARG_LIST
      do
         create args.make_1(create {INTEGER_CONSTANT}.make(0, start_position))
         create fn_item.ordinary_name(item_name, start_position)
         create Result.make_specialized(e_local, e_local.resolve_in(type), fn_item, args)
      end

   count_call (type: TYPE; e_local: EXPRESSION): FUNCTION_CALL_0 is
      local
         fn_count: FEATURE_NAME
      do
         create fn_count.ordinary_name(count_name, start_position)
         create Result.make_specialized(e_local, e_local.resolve_in(type), fn_count)
      end

   largest_range_of_values: INTEGER is
      local
         i, range: INTEGER
      do
         from
            i := when_list.lower
         until
            i > when_list.upper
         loop
            range := when_list.item(i).largest_range_of_values
            if range > Result then
               Result := range
            end
            i := i + 1
         end
      end

feature {WHEN_ITEM}
   validity_check_continued (type, expression_type: TYPE; occurrence_1: WHEN_ITEM) is
      require
         type /= Void
         expression_type /= Void
         occurrence_1 /= Void
      local
         i: INTEGER
      do
         from
            i := when_list.lower
         until
            i > when_list.upper
               or else
            when_list.item(i).validity_check_continued(type, expression_type, occurrence_1)
         loop
            i := i + 1
         end
      end

feature {MANIFEST_STRING_INSPECTOR}
   force_internal_values (type: TYPE) is
         -- Force the creation of values for this internally generated inspect statement
      local
         i: INTEGER; t: TYPE
      do
         t := expression.declaration_type
         if t.is_character then
            from
               i := when_list.lower
            until
               i > when_list.upper
            loop
               when_list.item(i).force_internal_character_values(type)
               i := i + 1
            end
         else
            check
               t.is_integer
            end
            from
               i := when_list.lower
            until
               i > when_list.upper
            loop
               when_list.item(i).force_internal_integer_values(type)
               i := i + 1
            end
         end
      end

feature {INSPECT_STATEMENT}
   validity_check (type, expression_type: TYPE) is
      require
         type /= Void
         expression_type /= Void
      deferred
      end

feature {INSPECT_STATEMENT}
   compute_values (type: TYPE) is
      local
         i: INTEGER
      do
         if when_list /= Void then
            from
               i := when_list.lower
            until
               i > when_list.upper
            loop
               when_list.item(i).compute_values(type)
               i := i + 1
            end
         end
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      local
         exp: like expression; wl: like when_list; ec: like else_compound; i: INTEGER
         when_clause: WHEN_CLAUSE; internal_local2: INTERNAL_LOCAL2
      do
         -- Handling of the `expression':
         expression.inline_dynamic_dispatch_(code_accumulator, type)
         exp := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         -- Now, we must look if it is necessary to add an extra INTERNAL_LOCAL2 to store `exp':
         if exp.is_stored_in_some_local_variable then
            -- Well, no need to add a new extra local.
         else
            create internal_local2.make(expression.start_position, exp, once "inspectDynamicDispatchExpression", False)
            code_accumulator.current_context.add_last(create {ASSIGNMENT}.make(internal_local2, exp))
            exp := internal_local2
         end
         if when_list /= Void then
            from
               create wl.make(when_list.count)
               i := when_list.lower
            until
               i > when_list.upper
            loop
               code_accumulator.open_new_context
               when_list.item(i).inline_dynamic_dispatch_(code_accumulator, type)
               when_clause ::= code_accumulator.current_context_to_instruction
               code_accumulator.close_current_context
               wl.put(when_clause, i)
               i := i + 1
            end
         end
         if else_compound /= Void then
            code_accumulator.open_new_context
            else_compound.inline_dynamic_dispatch_(code_accumulator, type)
            ec := code_accumulator.current_context_to_instruction
            code_accumulator.close_current_context
         end
         code_accumulator.current_context.add_last(current_or_twin_init(exp, wl, ec))
      end

feature {}
   make (sp: like start_position; exp: like expression) is
      require
         not sp.is_unknown
         exp /= Void
      do
         start_position := sp
         expression := exp
      ensure
         start_position = sp
         expression = exp
      end

   with_when_list (sp: like start_position; exp: like expression; wl: like when_list) is
      require
         not sp.is_unknown
         exp /= Void
         not wl.is_empty
      do
         start_position := sp
         expression := exp
         when_list := wl
      ensure
         start_position = sp
         expression = exp
         when_list = wl
      end

   make_strippable (sp: like start_position; exp: like expression; c_type: like condition_type) is
      require
         not sp.is_unknown
         exp /= Void
      do
         condition_type := c_type
         make(sp, exp)
      ensure
         start_position = sp
         expression = exp
      end

   current_or_twin_init (exp: like expression; wl: like when_list; ec: like else_compound): like Current is
      require
         exp /= Void
      do
         if exp = expression and then wl = when_list and then ec = else_compound then
            Result := Current
         else
            Result := twin
            Result.init(exp, wl, ec)
         end
      ensure
         Result.expression = exp
         Result.when_list = wl
         Result.else_compound = ec
      end

feature {}
   same_compound (type: TYPE; c1, c2: INSTRUCTION): BOOLEAN is
      local
         view1, view2: STRING
      do
         if c1 = c2 then
            Result := True
         elseif c1 = Void then
            -- No the same code.
         elseif c2 = Void then
            -- No the same code.
         elseif smart_eiffel.status.inlining_dynamic_dispatch_done then
            view1 := once "..... unique buffer 1 ....."
            if code_comparator.trace_in(view1, type, c1) then
               view2 := once "..... unique buffer 2 ....."
               if code_comparator.trace_in(view2, type, c2) then
                  if view1.is_equal(view2) then
                     Result := True
                  end
               end
            end
         end
      end

feature {INSPECT_STATEMENT_VISITOR}
   dynamic_dispatch_temporary1: DYNAMIC_DISPATCH_TEMPORARY1

   use_c_switch_statement: BOOLEAN is
         -- To decide if the generated C code is a True C "switch" or
         -- a sequence of "if... else if ... else ...").
      do
         --*** For the time being, this a naive implementation, because
         -- we may also  consider wich C compiler is used (see in
         -- `system_tools'). If someone want to do this, I think we should add a
         -- new function named `use_c_switch_statement' in system_tools.
         -- Just post the fix in the mailing list.
         if largest_range_of_values <= 32 then
            Result := True
         end
      end

feature {}
   code_comparator: CODE_COMPARATOR is
      once
         create Result.make
      end

invariant
   expression /= Void

end -- class INSPECT_STATEMENT
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
