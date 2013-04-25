-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class TYPE_ID_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = void_ty_id_low_level)  or else
				(a_value = float_ty_id_low_level)  or else
				(a_value = double_ty_id_low_level)  or else
				(a_value = x86_fp80ty_id_low_level)  or else
				(a_value = fp128ty_id_low_level)  or else
				(a_value = ppc_fp128ty_id_low_level)  or else
				(a_value = label_ty_id_low_level)  or else
				(a_value = metadata_ty_id_low_level)  or else
				(a_value = integer_ty_id_low_level)  or else
				(a_value = function_ty_id_low_level)  or else
				(a_value = struct_ty_id_low_level)  or else
				(a_value = union_ty_id_low_level)  or else
				(a_value = array_ty_id_low_level)  or else
				(a_value = pointer_ty_id_low_level)  or else
				(a_value = opaque_ty_id_low_level)  or else
				(a_value = vector_ty_id_low_level)  or else
				(a_value = num_type_ids_low_level)  or else
				(a_value = last_primitive_ty_id_low_level)  or else
				(a_value = first_derived_ty_id_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_void_ty_id is
		do
			value := void_ty_id_low_level
		end

	set_float_ty_id is
		do
			value := float_ty_id_low_level
		end

	set_double_ty_id is
		do
			value := double_ty_id_low_level
		end

	set_x86_fp80ty_id is
		do
			value := x86_fp80ty_id_low_level
		end

	set_fp128ty_id is
		do
			value := fp128ty_id_low_level
		end

	set_ppc_fp128ty_id is
		do
			value := ppc_fp128ty_id_low_level
		end

	set_label_ty_id is
		do
			value := label_ty_id_low_level
		end

	set_metadata_ty_id is
		do
			value := metadata_ty_id_low_level
		end

	set_integer_ty_id is
		do
			value := integer_ty_id_low_level
		end

	set_function_ty_id is
		do
			value := function_ty_id_low_level
		end

	set_struct_ty_id is
		do
			value := struct_ty_id_low_level
		end

	set_union_ty_id is
		do
			value := union_ty_id_low_level
		end

	set_array_ty_id is
		do
			value := array_ty_id_low_level
		end

	set_pointer_ty_id is
		do
			value := pointer_ty_id_low_level
		end

	set_opaque_ty_id is
		do
			value := opaque_ty_id_low_level
		end

	set_vector_ty_id is
		do
			value := vector_ty_id_low_level
		end

	set_num_type_ids is
		do
			value := num_type_ids_low_level
		end

	set_last_primitive_ty_id is
		do
			value := last_primitive_ty_id_low_level
		end

	set_first_derived_ty_id is
		do
			value := first_derived_ty_id_low_level
		end

feature {ANY} -- Queries
	void_ty_id: BOOLEAN is
		do
			Result := (value=void_ty_id_low_level)
		end

	float_ty_id: BOOLEAN is
		do
			Result := (value=float_ty_id_low_level)
		end

	double_ty_id: BOOLEAN is
		do
			Result := (value=double_ty_id_low_level)
		end

	x86_fp80ty_id: BOOLEAN is
		do
			Result := (value=x86_fp80ty_id_low_level)
		end

	fp128ty_id: BOOLEAN is
		do
			Result := (value=fp128ty_id_low_level)
		end

	ppc_fp128ty_id: BOOLEAN is
		do
			Result := (value=ppc_fp128ty_id_low_level)
		end

	label_ty_id: BOOLEAN is
		do
			Result := (value=label_ty_id_low_level)
		end

	metadata_ty_id: BOOLEAN is
		do
			Result := (value=metadata_ty_id_low_level)
		end

	integer_ty_id: BOOLEAN is
		do
			Result := (value=integer_ty_id_low_level)
		end

	function_ty_id: BOOLEAN is
		do
			Result := (value=function_ty_id_low_level)
		end

	struct_ty_id: BOOLEAN is
		do
			Result := (value=struct_ty_id_low_level)
		end

	union_ty_id: BOOLEAN is
		do
			Result := (value=union_ty_id_low_level)
		end

	array_ty_id: BOOLEAN is
		do
			Result := (value=array_ty_id_low_level)
		end

	pointer_ty_id: BOOLEAN is
		do
			Result := (value=pointer_ty_id_low_level)
		end

	opaque_ty_id: BOOLEAN is
		do
			Result := (value=opaque_ty_id_low_level)
		end

	vector_ty_id: BOOLEAN is
		do
			Result := (value=vector_ty_id_low_level)
		end

	num_type_ids: BOOLEAN is
		do
			Result := (value=num_type_ids_low_level)
		end

	last_primitive_ty_id: BOOLEAN is
		do
			Result := (value=last_primitive_ty_id_low_level)
		end

	first_derived_ty_id: BOOLEAN is
		do
			Result := (value=first_derived_ty_id_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	void_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "VoidTyID"
 			}"
 		end

	float_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FloatTyID"
 			}"
 		end

	double_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DoubleTyID"
 			}"
 		end

	x86_fp80ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "X86_FP80TyID"
 			}"
 		end

	fp128ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FP128TyID"
 			}"
 		end

	ppc_fp128ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PPC_FP128TyID"
 			}"
 		end

	label_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LabelTyID"
 			}"
 		end

	metadata_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "MetadataTyID"
 			}"
 		end

	integer_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "IntegerTyID"
 			}"
 		end

	function_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FunctionTyID"
 			}"
 		end

	struct_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "StructTyID"
 			}"
 		end

	union_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UnionTyID"
 			}"
 		end

	array_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ArrayTyID"
 			}"
 		end

	pointer_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PointerTyID"
 			}"
 		end

	opaque_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "OpaqueTyID"
 			}"
 		end

	vector_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "VectorTyID"
 			}"
 		end

	num_type_ids_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "NumTypeIDs"
 			}"
 		end

	last_primitive_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LastPrimitiveTyID"
 			}"
 		end

	first_derived_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FirstDerivedTyID"
 			}"
 		end


end -- class TYPE_ID_ENUM
