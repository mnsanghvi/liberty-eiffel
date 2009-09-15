class LIBERTY_AST_REQUIRE_ELSE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_REQUIRE_ELSE_VISITOR}
	is_require_else: BOOLEAN is
		do
			Result := count = 2 and then nodes.last.name.is_equal(once "KW else")
		end

	is_require_then: BOOLEAN is
		do
			Result := count = 2 and then nodes.last.name.is_equal(once "KW then")
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Require_Else"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 2 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_REQUIRE_ELSE_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_require_else(Current)
		end

end
