-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XML_PARSER_CTXT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xml_parser_ctxt_struct_set_sax (a_structure: POINTER; a_value: POINTER) is
			-- Setter for sax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_sax"
		}"
		end

	xml_parser_ctxt_struct_set_userdata (a_structure: POINTER; a_value: POINTER) is
			-- Setter for userData field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_userdata"
		}"
		end

	xml_parser_ctxt_struct_set_mydoc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for myDoc field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_mydoc"
		}"
		end

	xml_parser_ctxt_struct_set_wellformed (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for wellFormed field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_wellformed"
		}"
		end

	xml_parser_ctxt_struct_set_replaceentities (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for replaceEntities field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_replaceentities"
		}"
		end

	xml_parser_ctxt_struct_set_version (a_structure: POINTER; a_value: POINTER) is
			-- Setter for version field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_version"
		}"
		end

	xml_parser_ctxt_struct_set_encoding (a_structure: POINTER; a_value: POINTER) is
			-- Setter for encoding field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_encoding"
		}"
		end

	xml_parser_ctxt_struct_set_standalone (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for standalone field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_standalone"
		}"
		end

	xml_parser_ctxt_struct_set_html (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for html field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_html"
		}"
		end

	xml_parser_ctxt_struct_set_input (a_structure: POINTER; a_value: POINTER) is
			-- Setter for input field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_input"
		}"
		end

	xml_parser_ctxt_struct_set_inputnr (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for inputNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_inputnr"
		}"
		end

	xml_parser_ctxt_struct_set_inputmax (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for inputMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_inputmax"
		}"
		end

	xml_parser_ctxt_struct_set_inputtab (a_structure: POINTER; a_value: POINTER) is
			-- Setter for inputTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_inputtab"
		}"
		end

	xml_parser_ctxt_struct_set_node (a_structure: POINTER; a_value: POINTER) is
			-- Setter for node field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_node"
		}"
		end

	xml_parser_ctxt_struct_set_nodenr (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nodeNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nodenr"
		}"
		end

	xml_parser_ctxt_struct_set_nodemax (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nodeMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nodemax"
		}"
		end

	xml_parser_ctxt_struct_set_nodetab (a_structure: POINTER; a_value: POINTER) is
			-- Setter for nodeTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nodetab"
		}"
		end

	xml_parser_ctxt_struct_set_record_info (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for record_info field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_record_info"
		}"
		end

	xml_parser_ctxt_struct_set_errno (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for errNo field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_errno"
		}"
		end

	xml_parser_ctxt_struct_set_hasexternalsubset (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for hasExternalSubset field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_hasexternalsubset"
		}"
		end

	xml_parser_ctxt_struct_set_hasperefs (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for hasPErefs field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_hasperefs"
		}"
		end

	xml_parser_ctxt_struct_set_external_field (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for external field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_external_field"
		}"
		end

	xml_parser_ctxt_struct_set_valid (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for valid field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_valid"
		}"
		end

	xml_parser_ctxt_struct_set_validate (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for validate field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_validate"
		}"
		end

	xml_parser_ctxt_struct_set_instate (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for instate field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_instate"
		}"
		end

	xml_parser_ctxt_struct_set_token (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for token field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_token"
		}"
		end

	xml_parser_ctxt_struct_set_directory (a_structure: POINTER; a_value: POINTER) is
			-- Setter for directory field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_directory"
		}"
		end

	xml_parser_ctxt_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_name"
		}"
		end

	xml_parser_ctxt_struct_set_namenr (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nameNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_namenr"
		}"
		end

	xml_parser_ctxt_struct_set_namemax (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nameMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_namemax"
		}"
		end

	xml_parser_ctxt_struct_set_nametab (a_structure: POINTER; a_value: POINTER) is
			-- Setter for nameTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nametab"
		}"
		end

	xml_parser_ctxt_struct_set_nbchars (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for nbChars field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nbchars"
		}"
		end

	xml_parser_ctxt_struct_set_checkindex (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for checkIndex field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_checkindex"
		}"
		end

	xml_parser_ctxt_struct_set_keepblanks (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for keepBlanks field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_keepblanks"
		}"
		end

	xml_parser_ctxt_struct_set_disablesax (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for disableSAX field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_disablesax"
		}"
		end

	xml_parser_ctxt_struct_set_insubset (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for inSubset field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_insubset"
		}"
		end

	xml_parser_ctxt_struct_set_intsubname (a_structure: POINTER; a_value: POINTER) is
			-- Setter for intSubName field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_intsubname"
		}"
		end

	xml_parser_ctxt_struct_set_extsuburi (a_structure: POINTER; a_value: POINTER) is
			-- Setter for extSubURI field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_extsuburi"
		}"
		end

	xml_parser_ctxt_struct_set_extsubsystem (a_structure: POINTER; a_value: POINTER) is
			-- Setter for extSubSystem field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_extsubsystem"
		}"
		end

	xml_parser_ctxt_struct_set_space (a_structure: POINTER; a_value: POINTER) is
			-- Setter for space field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_space"
		}"
		end

	xml_parser_ctxt_struct_set_spacenr (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for spaceNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_spacenr"
		}"
		end

	xml_parser_ctxt_struct_set_spacemax (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for spaceMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_spacemax"
		}"
		end

	xml_parser_ctxt_struct_set_spacetab (a_structure: POINTER; a_value: POINTER) is
			-- Setter for spaceTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_spacetab"
		}"
		end

	xml_parser_ctxt_struct_set_depth (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for depth field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_depth"
		}"
		end

	xml_parser_ctxt_struct_set_entity (a_structure: POINTER; a_value: POINTER) is
			-- Setter for entity field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_entity"
		}"
		end

	xml_parser_ctxt_struct_set_charset (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for charset field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_charset"
		}"
		end

	xml_parser_ctxt_struct_set_nodelen (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nodelen field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nodelen"
		}"
		end

	xml_parser_ctxt_struct_set_nodemem (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nodemem field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nodemem"
		}"
		end

	xml_parser_ctxt_struct_set_pedantic (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for pedantic field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_pedantic"
		}"
		end

	xml_parser_ctxt_struct_set_loadsubset (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for loadsubset field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_loadsubset"
		}"
		end

	xml_parser_ctxt_struct_set_linenumbers (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for linenumbers field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_linenumbers"
		}"
		end

	xml_parser_ctxt_struct_set_catalogs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for catalogs field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_catalogs"
		}"
		end

	xml_parser_ctxt_struct_set_recovery (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for recovery field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_recovery"
		}"
		end

	xml_parser_ctxt_struct_set_progressive (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for progressive field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_progressive"
		}"
		end

	xml_parser_ctxt_struct_set_dict (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dict field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_dict"
		}"
		end

	xml_parser_ctxt_struct_set_atts (a_structure: POINTER; a_value: POINTER) is
			-- Setter for atts field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_atts"
		}"
		end

	xml_parser_ctxt_struct_set_maxatts (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for maxatts field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_maxatts"
		}"
		end

	xml_parser_ctxt_struct_set_docdict (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for docdict field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_docdict"
		}"
		end

	xml_parser_ctxt_struct_set_str_xml (a_structure: POINTER; a_value: POINTER) is
			-- Setter for str_xml field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_str_xml"
		}"
		end

	xml_parser_ctxt_struct_set_str_xmlns (a_structure: POINTER; a_value: POINTER) is
			-- Setter for str_xmlns field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_str_xmlns"
		}"
		end

	xml_parser_ctxt_struct_set_str_xml_ns (a_structure: POINTER; a_value: POINTER) is
			-- Setter for str_xml_ns field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_str_xml_ns"
		}"
		end

	xml_parser_ctxt_struct_set_sax2 (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for sax2 field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_sax2"
		}"
		end

	xml_parser_ctxt_struct_set_nsnr (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nsNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nsnr"
		}"
		end

	xml_parser_ctxt_struct_set_nsmax (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nsMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nsmax"
		}"
		end

	xml_parser_ctxt_struct_set_nstab (a_structure: POINTER; a_value: POINTER) is
			-- Setter for nsTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nstab"
		}"
		end

	xml_parser_ctxt_struct_set_attallocs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for attallocs field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_attallocs"
		}"
		end

	xml_parser_ctxt_struct_set_pushtab (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pushTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_pushtab"
		}"
		end

	xml_parser_ctxt_struct_set_attsdefault (a_structure: POINTER; a_value: POINTER) is
			-- Setter for attsDefault field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_attsdefault"
		}"
		end

	xml_parser_ctxt_struct_set_attsspecial (a_structure: POINTER; a_value: POINTER) is
			-- Setter for attsSpecial field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_attsspecial"
		}"
		end

	xml_parser_ctxt_struct_set_nswellformed (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nsWellFormed field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nswellformed"
		}"
		end

	xml_parser_ctxt_struct_set_options (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for options field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_options"
		}"
		end

	xml_parser_ctxt_struct_set_dictnames (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for dictNames field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_dictnames"
		}"
		end

	xml_parser_ctxt_struct_set_freeelemsnr (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for freeElemsNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_freeelemsnr"
		}"
		end

	xml_parser_ctxt_struct_set_freeelems (a_structure: POINTER; a_value: POINTER) is
			-- Setter for freeElems field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_freeelems"
		}"
		end

	xml_parser_ctxt_struct_set_freeattrsnr (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for freeAttrsNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_freeattrsnr"
		}"
		end

	xml_parser_ctxt_struct_set_freeattrs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for freeAttrs field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_freeattrs"
		}"
		end

	xml_parser_ctxt_struct_set_parsemode (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for parseMode field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_parsemode"
		}"
		end

	xml_parser_ctxt_struct_set_nbentities (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for nbentities field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nbentities"
		}"
		end

	xml_parser_ctxt_struct_set_sizeentities (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for sizeentities field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_sizeentities"
		}"
		end

	xml_parser_ctxt_struct_set_nodeinfo (a_structure: POINTER; a_value: POINTER) is
			-- Setter for nodeInfo field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nodeinfo"
		}"
		end

	xml_parser_ctxt_struct_set_nodeinfonr (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nodeInfoNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nodeinfonr"
		}"
		end

	xml_parser_ctxt_struct_set_nodeinfomax (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nodeInfoMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nodeinfomax"
		}"
		end

	xml_parser_ctxt_struct_set_nodeinfotab (a_structure: POINTER; a_value: POINTER) is
			-- Setter for nodeInfoTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_set_nodeinfotab"
		}"
		end

feature {} -- Low-level queries

	xml_parser_ctxt_struct_get_sax (a_structure: POINTER): POINTER is
			-- Query for sax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_sax"
		}"
		end

	xml_parser_ctxt_struct_get_userdata (a_structure: POINTER): POINTER is
			-- Query for userData field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_userdata"
		}"
		end

	xml_parser_ctxt_struct_get_mydoc (a_structure: POINTER): POINTER is
			-- Query for myDoc field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_mydoc"
		}"
		end

	xml_parser_ctxt_struct_get_wellformed (a_structure: POINTER): INTEGER_32 is
			-- Query for wellFormed field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_wellformed"
		}"
		end

	xml_parser_ctxt_struct_get_replaceentities (a_structure: POINTER): INTEGER_32 is
			-- Query for replaceEntities field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_replaceentities"
		}"
		end

	xml_parser_ctxt_struct_get_version (a_structure: POINTER): POINTER is
			-- Query for version field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_version"
		}"
		end

	xml_parser_ctxt_struct_get_encoding (a_structure: POINTER): POINTER is
			-- Query for encoding field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_encoding"
		}"
		end

	xml_parser_ctxt_struct_get_standalone (a_structure: POINTER): INTEGER_32 is
			-- Query for standalone field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_standalone"
		}"
		end

	xml_parser_ctxt_struct_get_html (a_structure: POINTER): INTEGER_32 is
			-- Query for html field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_html"
		}"
		end

	xml_parser_ctxt_struct_get_input (a_structure: POINTER): POINTER is
			-- Query for input field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_input"
		}"
		end

	xml_parser_ctxt_struct_get_inputnr (a_structure: POINTER): INTEGER_32 is
			-- Query for inputNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_inputnr"
		}"
		end

	xml_parser_ctxt_struct_get_inputmax (a_structure: POINTER): INTEGER_32 is
			-- Query for inputMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_inputmax"
		}"
		end

	xml_parser_ctxt_struct_get_inputtab (a_structure: POINTER): POINTER is
			-- Query for inputTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_inputtab"
		}"
		end

	xml_parser_ctxt_struct_get_node (a_structure: POINTER): POINTER is
			-- Query for node field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_node"
		}"
		end

	xml_parser_ctxt_struct_get_nodenr (a_structure: POINTER): INTEGER_32 is
			-- Query for nodeNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nodenr"
		}"
		end

	xml_parser_ctxt_struct_get_nodemax (a_structure: POINTER): INTEGER_32 is
			-- Query for nodeMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nodemax"
		}"
		end

	xml_parser_ctxt_struct_get_nodetab (a_structure: POINTER): POINTER is
			-- Query for nodeTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nodetab"
		}"
		end

	xml_parser_ctxt_struct_get_record_info (a_structure: POINTER): INTEGER_32 is
			-- Query for record_info field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_record_info"
		}"
		end

	-- Unwrappable field node_seq.
	xml_parser_ctxt_struct_get_errno (a_structure: POINTER): INTEGER_32 is
			-- Query for errNo field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_errno"
		}"
		end

	xml_parser_ctxt_struct_get_hasexternalsubset (a_structure: POINTER): INTEGER_32 is
			-- Query for hasExternalSubset field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_hasexternalsubset"
		}"
		end

	xml_parser_ctxt_struct_get_hasperefs (a_structure: POINTER): INTEGER_32 is
			-- Query for hasPErefs field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_hasperefs"
		}"
		end

	xml_parser_ctxt_struct_get_external_field (a_structure: POINTER): INTEGER_32 is
			-- Query for external field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_external_field"
		}"
		end

	xml_parser_ctxt_struct_get_valid (a_structure: POINTER): INTEGER_32 is
			-- Query for valid field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_valid"
		}"
		end

	xml_parser_ctxt_struct_get_validate (a_structure: POINTER): INTEGER_32 is
			-- Query for validate field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_validate"
		}"
		end

	-- Unwrappable field vctxt.
	xml_parser_ctxt_struct_get_instate (a_structure: POINTER): INTEGER is
			-- Query for instate field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_instate"
		}"
		end

	xml_parser_ctxt_struct_get_token (a_structure: POINTER): INTEGER_32 is
			-- Query for token field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_token"
		}"
		end

	xml_parser_ctxt_struct_get_directory (a_structure: POINTER): POINTER is
			-- Query for directory field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_directory"
		}"
		end

	xml_parser_ctxt_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_name"
		}"
		end

	xml_parser_ctxt_struct_get_namenr (a_structure: POINTER): INTEGER_32 is
			-- Query for nameNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_namenr"
		}"
		end

	xml_parser_ctxt_struct_get_namemax (a_structure: POINTER): INTEGER_32 is
			-- Query for nameMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_namemax"
		}"
		end

	xml_parser_ctxt_struct_get_nametab (a_structure: POINTER): POINTER is
			-- Query for nameTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nametab"
		}"
		end

	xml_parser_ctxt_struct_get_nbchars (a_structure: POINTER): INTEGER_64 is
			-- Query for nbChars field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nbchars"
		}"
		end

	xml_parser_ctxt_struct_get_checkindex (a_structure: POINTER): INTEGER_64 is
			-- Query for checkIndex field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_checkindex"
		}"
		end

	xml_parser_ctxt_struct_get_keepblanks (a_structure: POINTER): INTEGER_32 is
			-- Query for keepBlanks field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_keepblanks"
		}"
		end

	xml_parser_ctxt_struct_get_disablesax (a_structure: POINTER): INTEGER_32 is
			-- Query for disableSAX field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_disablesax"
		}"
		end

	xml_parser_ctxt_struct_get_insubset (a_structure: POINTER): INTEGER_32 is
			-- Query for inSubset field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_insubset"
		}"
		end

	xml_parser_ctxt_struct_get_intsubname (a_structure: POINTER): POINTER is
			-- Query for intSubName field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_intsubname"
		}"
		end

	xml_parser_ctxt_struct_get_extsuburi (a_structure: POINTER): POINTER is
			-- Query for extSubURI field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_extsuburi"
		}"
		end

	xml_parser_ctxt_struct_get_extsubsystem (a_structure: POINTER): POINTER is
			-- Query for extSubSystem field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_extsubsystem"
		}"
		end

	xml_parser_ctxt_struct_get_space (a_structure: POINTER): POINTER is
			-- Query for space field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_space"
		}"
		end

	xml_parser_ctxt_struct_get_spacenr (a_structure: POINTER): INTEGER_32 is
			-- Query for spaceNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_spacenr"
		}"
		end

	xml_parser_ctxt_struct_get_spacemax (a_structure: POINTER): INTEGER_32 is
			-- Query for spaceMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_spacemax"
		}"
		end

	xml_parser_ctxt_struct_get_spacetab (a_structure: POINTER): POINTER is
			-- Query for spaceTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_spacetab"
		}"
		end

	xml_parser_ctxt_struct_get_depth (a_structure: POINTER): INTEGER_32 is
			-- Query for depth field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_depth"
		}"
		end

	xml_parser_ctxt_struct_get_entity (a_structure: POINTER): POINTER is
			-- Query for entity field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_entity"
		}"
		end

	xml_parser_ctxt_struct_get_charset (a_structure: POINTER): INTEGER_32 is
			-- Query for charset field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_charset"
		}"
		end

	xml_parser_ctxt_struct_get_nodelen (a_structure: POINTER): INTEGER_32 is
			-- Query for nodelen field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nodelen"
		}"
		end

	xml_parser_ctxt_struct_get_nodemem (a_structure: POINTER): INTEGER_32 is
			-- Query for nodemem field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nodemem"
		}"
		end

	xml_parser_ctxt_struct_get_pedantic (a_structure: POINTER): INTEGER_32 is
			-- Query for pedantic field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_pedantic"
		}"
		end

	-- Unwrappable field _private.
	xml_parser_ctxt_struct_get_loadsubset (a_structure: POINTER): INTEGER_32 is
			-- Query for loadsubset field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_loadsubset"
		}"
		end

	xml_parser_ctxt_struct_get_linenumbers (a_structure: POINTER): INTEGER_32 is
			-- Query for linenumbers field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_linenumbers"
		}"
		end

	xml_parser_ctxt_struct_get_catalogs (a_structure: POINTER): POINTER is
			-- Query for catalogs field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_catalogs"
		}"
		end

	xml_parser_ctxt_struct_get_recovery (a_structure: POINTER): INTEGER_32 is
			-- Query for recovery field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_recovery"
		}"
		end

	xml_parser_ctxt_struct_get_progressive (a_structure: POINTER): INTEGER_32 is
			-- Query for progressive field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_progressive"
		}"
		end

	xml_parser_ctxt_struct_get_dict (a_structure: POINTER): POINTER is
			-- Query for dict field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_dict"
		}"
		end

	xml_parser_ctxt_struct_get_atts (a_structure: POINTER): POINTER is
			-- Query for atts field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_atts"
		}"
		end

	xml_parser_ctxt_struct_get_maxatts (a_structure: POINTER): INTEGER_32 is
			-- Query for maxatts field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_maxatts"
		}"
		end

	xml_parser_ctxt_struct_get_docdict (a_structure: POINTER): INTEGER_32 is
			-- Query for docdict field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_docdict"
		}"
		end

	xml_parser_ctxt_struct_get_str_xml (a_structure: POINTER): POINTER is
			-- Query for str_xml field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_str_xml"
		}"
		end

	xml_parser_ctxt_struct_get_str_xmlns (a_structure: POINTER): POINTER is
			-- Query for str_xmlns field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_str_xmlns"
		}"
		end

	xml_parser_ctxt_struct_get_str_xml_ns (a_structure: POINTER): POINTER is
			-- Query for str_xml_ns field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_str_xml_ns"
		}"
		end

	xml_parser_ctxt_struct_get_sax2 (a_structure: POINTER): INTEGER_32 is
			-- Query for sax2 field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_sax2"
		}"
		end

	xml_parser_ctxt_struct_get_nsnr (a_structure: POINTER): INTEGER_32 is
			-- Query for nsNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nsnr"
		}"
		end

	xml_parser_ctxt_struct_get_nsmax (a_structure: POINTER): INTEGER_32 is
			-- Query for nsMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nsmax"
		}"
		end

	xml_parser_ctxt_struct_get_nstab (a_structure: POINTER): POINTER is
			-- Query for nsTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nstab"
		}"
		end

	xml_parser_ctxt_struct_get_attallocs (a_structure: POINTER): POINTER is
			-- Query for attallocs field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_attallocs"
		}"
		end

	xml_parser_ctxt_struct_get_pushtab (a_structure: POINTER): POINTER is
			-- Query for pushTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_pushtab"
		}"
		end

	xml_parser_ctxt_struct_get_attsdefault (a_structure: POINTER): POINTER is
			-- Query for attsDefault field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_attsdefault"
		}"
		end

	xml_parser_ctxt_struct_get_attsspecial (a_structure: POINTER): POINTER is
			-- Query for attsSpecial field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_attsspecial"
		}"
		end

	xml_parser_ctxt_struct_get_nswellformed (a_structure: POINTER): INTEGER_32 is
			-- Query for nsWellFormed field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nswellformed"
		}"
		end

	xml_parser_ctxt_struct_get_options (a_structure: POINTER): INTEGER_32 is
			-- Query for options field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_options"
		}"
		end

	xml_parser_ctxt_struct_get_dictnames (a_structure: POINTER): INTEGER_32 is
			-- Query for dictNames field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_dictnames"
		}"
		end

	xml_parser_ctxt_struct_get_freeelemsnr (a_structure: POINTER): INTEGER_32 is
			-- Query for freeElemsNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_freeelemsnr"
		}"
		end

	xml_parser_ctxt_struct_get_freeelems (a_structure: POINTER): POINTER is
			-- Query for freeElems field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_freeelems"
		}"
		end

	xml_parser_ctxt_struct_get_freeattrsnr (a_structure: POINTER): INTEGER_32 is
			-- Query for freeAttrsNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_freeattrsnr"
		}"
		end

	xml_parser_ctxt_struct_get_freeattrs (a_structure: POINTER): POINTER is
			-- Query for freeAttrs field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_freeattrs"
		}"
		end

	-- Unwrappable field lastError.
	xml_parser_ctxt_struct_get_parsemode (a_structure: POINTER): INTEGER is
			-- Query for parseMode field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_parsemode"
		}"
		end

	xml_parser_ctxt_struct_get_nbentities (a_structure: POINTER): NATURAL_64 is
			-- Query for nbentities field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nbentities"
		}"
		end

	xml_parser_ctxt_struct_get_sizeentities (a_structure: POINTER): NATURAL_64 is
			-- Query for sizeentities field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_sizeentities"
		}"
		end

	xml_parser_ctxt_struct_get_nodeinfo (a_structure: POINTER): POINTER is
			-- Query for nodeInfo field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nodeinfo"
		}"
		end

	xml_parser_ctxt_struct_get_nodeinfonr (a_structure: POINTER): INTEGER_32 is
			-- Query for nodeInfoNr field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nodeinfonr"
		}"
		end

	xml_parser_ctxt_struct_get_nodeinfomax (a_structure: POINTER): INTEGER_32 is
			-- Query for nodeInfoMax field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nodeinfomax"
		}"
		end

	xml_parser_ctxt_struct_get_nodeinfotab (a_structure: POINTER): POINTER is
			-- Query for nodeInfoTab field of XML_PARSER_CTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xml_parser_ctxt_struct_get_nodeinfotab"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlParserCtxt"
		}"
		end

end -- class XML_PARSER_CTXT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

