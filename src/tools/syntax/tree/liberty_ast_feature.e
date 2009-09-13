class LIBERTY_AST_FEATURE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	clients: EIFFEL_LIST_NODE is
		do
			Result ::= node.item(2)
		end

	definition_list: EIFFEL_LIST_NODE is
		do
			Result ::= node.item(4)
		end

feature {ANY}
	count: INTEGER is 5

	name: STRING is "Feature"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 5 >> }
		end

end