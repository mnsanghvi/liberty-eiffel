-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GOBJECT_AUTOCLEANUPS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	glib_auto_cleanup_gvalue (a_ptr: POINTER) 
               -- glib_auto_cleanup_GValue
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "glib_auto_cleanup_GValue"
               }"
               end

	glib_autoptr_cleanup_ginitially_unowned (a_ptr: POINTER) 
               -- glib_autoptr_cleanup_GInitiallyUnowned
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "glib_autoptr_cleanup_GInitiallyUnowned"
               }"
               end

	glib_autoptr_cleanup_gobject (a_ptr: POINTER) 
               -- glib_autoptr_cleanup_GObject
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "glib_autoptr_cleanup_GObject"
               }"
               end


end -- class GOBJECT_AUTOCLEANUPS_EXTERNALS
