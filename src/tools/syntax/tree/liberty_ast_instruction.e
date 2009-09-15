class LIBERTY_AST_INSTRUCTION

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_INSTRUCTION_VISITOR}
	instruction: LIBERTY_AST_NON_TERMINAL_NODE is
		do
			Result ::= nodes.item(0)
		end

feature {ANY}
	count: INTEGER is 1

	name: STRING is "Instruction"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_INSTRUCTION_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_instruction(Current)
		end

end
