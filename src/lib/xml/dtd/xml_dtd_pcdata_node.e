class XML_DTD_PCDATA_NODE

inherit
   BACKTRACKING_NODE
      redefine
         out_in_tagged_out_memory
      end

create {XML_DTD_ELEMENT}
   make

feature {ANY}
   out_in_tagged_out_memory is
      do
         tagged_out_memory.append(once "PCDATA")
      end

feature {ANY} -- Tree structure validation
   explore (explorer: XML_DTD_VALIDATOR) is
      do
         explorer.backtrack_valid_pcdata
      end

feature {}
   make is
      do
      end

end -- class XML_DTD_PCDATA_NODE
