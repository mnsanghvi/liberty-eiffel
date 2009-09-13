class LIBERTY_AST_ALIAS

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	has_alias: BOOLEAN is
		do
			Result := count = 2
		end

	definition: LIBERTY_AST_STRING is
		require
			has_alias
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.capacity
		end

	name: STRING is "Alias"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 2 >> }
		end

end