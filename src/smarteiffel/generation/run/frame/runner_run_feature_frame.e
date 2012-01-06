-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_RUN_FEATURE_FRAME

inherit
   RUNNER_FRAME
      rename
         make as make_frame
      end

create {RUNNER_FEATURES}
   make

feature {RUNNER_FEATURES}
   start_position: POSITION is
      do
         Result := rf.start_position
      end

feature {RUNNER_FACET}
   name: FEATURE_NAME is
      do
         Result := rf.name
      end

   arguments: TRAVERSABLE[RUNNER_OBJECT] is
      do
         if arguments_set then
            Result := arguments_memory
         else
            Result := arguments_factory.item([])
            arguments_memory := Result
            arguments_set := True
            debug ("run.data")
               std_output.put_string(once "(#(1)) #(2): arguments: " # depth.out # rf.name.to_string)
               if Result /= Void then
                  std_output.put_line(Result.out)
               else
                  std_output.put_line(once "Void")
               end
            end
         end
      end

   type_of_current: TYPE is
      do
         Result := rf.type_of_current
      end

   type_of_result: TYPE is
      local
         tm: TYPE_MARK
      do
         tm := rf.result_type
         if tm /= Void then
            Result := tm.resolve_in(type_of_current)
         end
      end

   feature_stamp: FEATURE_STAMP is
      do
         Result := rf.feature_stamp
      end

   formal_arguments: FORMAL_ARG_LIST is
      do
         Result := rf.arguments
      end

feature {}
   make (a_processor: like processor; a_caller: like caller; a_target: like target; a_arguments_factory: like arguments_factory; a_rf: like rf) is
      require
         a_processor /= Void
         a_target /= Void
         a_arguments_factory /= Void
         a_rf /= Void
      do
         if a_arguments_factory = Void then
            arguments_set := True
         else
            arguments_factory := a_arguments_factory
         end
         rf := a_rf
         make_frame(a_processor, a_caller, a_target)
      ensure
         processor = a_processor
         caller = a_caller
         target = a_target
         arguments_factory = a_arguments_factory
         rf = a_rf
         a_rf.local_vars /= Void implies locals.count = a_rf.local_vars.count
         a_rf.local_vars = Void implies locals = Void
      end

   local_vars: LOCAL_VAR_LIST is
      do
         Result := rf.local_vars
      end

   arguments_factory: FUNCTION[TUPLE, TRAVERSABLE[RUNNER_OBJECT]]
   arguments_memory: TRAVERSABLE[RUNNER_OBJECT]
   arguments_set: BOOLEAN

   rf: RUN_FEATURE

invariant
   rf /= Void
   arguments_factory = Void implies arguments_set

   --| **** TODO rf.type_of_current = target.type

end -- class RUNNER_RUN_FEATURE_FRAME