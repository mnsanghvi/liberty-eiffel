-- See the Copyright notice at the end of this file.
--
deferred class JOB
	--The job life will looks like :
	--   do
	--      prepare
	--      if is_ready then
	--         continue
	--   repeat while not done
	--
	--If the same job as to live again, restart is called.
	--
	-- Note: never change priority after job inserted in loop_item.
	--       Priority should only be set at creation time.
	--

insert
	ANY
	PLATFORM

feature {JOB, LOOP_ITEM}
	priority: INTEGER
			-- Never change priority after job inserted in loop_item.
			-- Priority should only be set at creation time.

feature {LOOP_ITEM}
	prepare (events: EVENTS_SET) is
			-- Use `events' to descibe condition that make this job ready to `continue'.
			-- `events' describe the conditions to be satisfied before 
			-- runing this job for one more step.
		require
			events /= Void
			not events.queryable
			not done
		deferred
		end

	is_ready (events: EVENTS_SET): BOOLEAN is
			-- Check if this job is ready to continue his work.
			-- `events' describe the events which occured.
		require
			events /= Void
			events.queryable
			not done
		deferred
		end

	continue is
			-- Continue to do the job.
			-- The work to do has to be small work and non blocking, it
			-- will continue on next call.
		require
			not done
		deferred
		end

	done: BOOLEAN is
			-- `done' returns `True' when the job is finished. Then the
			-- job may be `restart'(ed) if it need to run again.
		deferred
		end

	restart is
			-- Configure the job like the initial state.
			-- Example: when some window dialog appears second time, all
			-- jobs from this window are restarted.
		require
			done
		deferred
		ensure
			not done
		end

	infix "<" (other: JOB): BOOLEAN is
		do
			Result := priority < other.priority
		end

invariant
	priority /= Minimum_integer

end -- class JOB
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