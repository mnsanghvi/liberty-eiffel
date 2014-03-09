deferred class EDC_DESCRIPTOR[K_ -> TUPLE]

insert
   EDC_CONSTANTS

feature {ANY}
   delete (record: EDC_RECORD) is
      require
         record /= Void
      deferred
      end

   criterion_primary_key (a_pk: K_): EDC_CRITERION is
      require
         a_pk /= Void
      deferred
      ensure
         Result /= Void
      end

end -- class EDC_TYPED_DESCRIPTOR
