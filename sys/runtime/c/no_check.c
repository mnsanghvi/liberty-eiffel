/*
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
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
*/
/*
  This file (SmartEiffel/sys/runtime/no_check.c) is automatically included
  when `ace.no_check' is true (ie. all modes except -boost).
*/

int assertion_depth=1;

/*
   To print object into the trace-stack :
*/
void se_prinT0(FILE* file, T0** o) {
    if (*o == NULL) {
	fprintf(file,"Void");
    }
    else {
	fprintf(file,"#%p",(void*)*o);
    }
}

void se_prinT1(FILE* file, EIF_INTEGER_8* o) {
    fprintf(file,"%"PRId8,*o);
}

void se_prinT2(FILE* file, EIF_INTEGER* o) {
    fprintf(file,"%"PRId32,*o);
}

void se_prinT10(FILE* file, EIF_INTEGER_16* o) {
    fprintf(file,"%"PRId16,*o);
}

void se_prinT11(FILE* file,EIF_INTEGER_64* o) {
    fprintf(file,"%"PRId64,*o);
}

static void se_print_character(FILE* file, char c) {
    /* Produce a visible output of `c' using an Eiffelish notation.
     */
    if ((' ' <= c)&&(c <= '~')&&(c != '\'')&&(c != '\"')&&(c != '%')) {
	putc(c,file);
    }
    else {
	switch (c) {
	    case '\b': fprintf(file,"%%B"); break;
	    case '\f': fprintf(file,"%%F"); break;
	    case '\n': fprintf(file,"%%N"); break;
	    case '\r': fprintf(file,"%%R"); break;
	    case '\t': fprintf(file,"%%T"); break;
	    case '\0': fprintf(file,"%%U"); break;
	    case '\'': fprintf(file,"%%\'"); break;
	    case '\"': fprintf(file,"%%\""); break;
	    case '%':  fprintf(file,"%%%%"); break;
	    default:
		fprintf(file,"%%/%d/", (int) ((unsigned char) c));
	}
    }
}

void se_prinT3(FILE* file,EIF_CHARACTER* o) {
    putc('\'',file);
    se_print_character(file, *o);
    putc('\'',file);
}

void se_prinT4(FILE* file, EIF_REAL_32* o) {
    fprintf(file, "%.7e", ((real64_t)*o));
}

void se_prinT5(FILE* file, EIF_REAL_64* o) {
    fprintf(file, "%.16e", *o);
}

void se_prinT12(FILE* file, EIF_REAL_EXTENDED* o) {
    fprintf(file, "%.19Le", *o);
}

void se_prinT6(FILE* file, EIF_BOOLEAN* o) {
    if (*o) {
	fprintf(file,"True");
    }
    else {
	fprintf(file,"False");
    }
}

void se_prinT7(FILE* file, EIF_STRING* o) {
    if (*o == NULL) {
	fprintf(file,"Void");
    }
    else {
	T3* storage = (*o)->_storage;
	int count = (*o)->_count;
	int i = 0;
	putc('\"',file);
	while (i < count) {
	    se_print_character(file, storage[i++]);
	}
	putc('\"',file);
    }
}

void se_prinT8(FILE* file, EIF_POINTER* o) {
    if (*o == NULL) {
	fprintf(file,"NULL");
    }
    else {
	fprintf(file,"POINTER#%p",(void*)*o);
    }
}


/*
  The upper most context (SmartEiffel Dump stack Top) :
*/
se_dump_stack* se_dst=NULL;
int se_dst_depth=0;

int se_stack_size(se_dump_stack* ds) {
  return se_dst_depth;
}

void se_print_run_time_stack(void) {
  se_print_run_time_stack_in(SE_ERR);
}

void se_print_run_time_stack_in(FILE* file) {
  /* ANY.print_run_time_stack */
  se_dump_stack* origin;
  se_dump_stack* ds;
  se_dump_stack* ds2;
  int frame_count = 1;
  int rescue = 0;

  handle(SE_HANDLE_ENTER_PRINT_STACK, NULL);
  origin = se_dst;
  if (origin == NULL) {
    fprintf(file,"Empty stack.\n");
    return ;
  }
  else {
    while (origin->exception_origin != NULL) {
      origin = origin->exception_origin;
    }

    ds = origin;
    while (ds->caller != NULL) {
      ds = ds->caller;
      frame_count++;
    }
  }
  fprintf(file,"%d frames in current stack.\n",frame_count);
  fprintf(file,"=====  Bottom of run-time stack  =====\n");
  while (ds != NULL) {
    se_print_one_frame_in(file,ds);
    /* Next frame : */
    if (ds == origin) {
      ds = NULL;
    }
    else if (ds->exception_origin != NULL) {
      rescue = 1;
      ds = ds->exception_origin;
    }
    else {
      ds2 = se_dst;
      while (ds2->caller != ds) {
	ds2 = ds2->caller;
      }
      ds = ds2;
    }
    if (--frame_count) {
      if (!rescue) {
        fprintf(file,"======================================\n");
      }
      else {
        fprintf(file,"====   Rescue stack  =================\n");
      }
    }
  }
  fprintf(file,"=====   Top of run-time stack    =====\n");

  handle(SE_HANDLE_EXIT_PRINT_STACK, NULL);
}

int se_print_one_frame(se_dump_stack* ds) {
  return se_print_one_frame_in(SE_ERR, ds);
}

int se_print_one_frame_in(FILE* file, se_dump_stack* ds) {
  /* Return 1 for an ordinary frame (not a cecil frame or some dynamic
     dispatch extra frame). */
  se_frame_descriptor* fd = ds->fd;
  int i = 0;
  int local_count = 0;
  char* local_format;
  int expanded;
  int id;
  void** var;

  if (fd == NULL) {
    fprintf(file,"External CECIL call.\n");
    return 0;
  }
  fprintf(file,"%s\n",fd->name);
  if (ds->p == 0) return 0;
  local_format = fd->local_format;
  if (fd->use_current) {
    fprintf(file,"Current = ");
    i = 2;
    id = 0;
    while (local_format[i] != '%') {
      id = (id * 10) + (local_format[i] - '0');
      i++;
    }
    i++;
    (se_prinT[id])(file, ds->current);
    fprintf(file,"\n");
  }
  while (local_count < fd->local_count) {
    while (local_format[i] != '%') {
      fprintf(file,"%c",local_format[i]);
      i++;
    }
    i++;
    expanded = ((local_format[i++] == 'E')?1:0);
    fprintf(file," = ");
    id = 0;
    while (local_format[i] != '%') {
      id = (id * 10) + (local_format[i] - '0');
      i++;
    }
    i++;
    if (ds->locals == NULL) {
      fprintf(file,"<unavailable>");
    }
    else {
      var = (ds->locals)[local_count];
      if (expanded) {
        (se_prinT[id])(file, (void**)(var));
      }
      else if (*var == NULL) {
        fprintf(file,"Void");
      }
      else {
        (se_prinT[((T0*)(*var))->id])(file, (void**)(var));
      }
    }
    fprintf(file,"\n");
    local_count++;
  }
  fprintf(file,"line %d ",se_position2line(ds->p));
  fflush(file);
  fprintf(file,"column %d ",se_position2column(ds->p));
  fflush(file);
  fprintf(file,"file %s \n",p[se_position2path_id(ds->p)]);
  fflush(file);
  return 1;
}

int se_rci(se_dump_stack*caller,void*C) {
  /* Where `caller' is supposed to be reference type non Void Current
     object. This function return 1 if the class invariant must be
     checked for `C' before leaving the routine.
  */
  if (caller != NULL) {
    se_frame_descriptor* fd = caller->fd;
    if (fd == NULL) {
      /* As for example when coming via CECIL. */
      return 0;
    }
    else {
      if (fd->use_current) {
	if (fd->local_format[1] == 'R') {
	  if ((*((void**)caller->current)) == C) {
	    return 0;
	  }
	}
      }
    }
  }
  return 1;
}

void error0(char* m, char* vv) {
  /* When there is nothing more to do than to exit or to go back
     into the debugger.
  */
  static char*f="*** Error at Run Time ***: %s\n";

  fprintf(SE_ERR,f,m);
  if (vv!=NULL) fprintf(SE_ERR,f,vv);
#ifdef SE_EXCEPTIONS
  print_exception();
#endif
#ifdef SE_SEDB
  sedb_break(se_dst,0);
#else
  handle(SE_HANDLE_RUNTIME_ERROR, m);
  se_print_run_time_stack();
  fprintf(SE_ERR,f,m);
  if (vv!=NULL)
    fprintf(SE_ERR,f,vv);
  exit(EXIT_FAILURE);
#endif
}

void error1(char*m,se_position position) {
  /* When there is nothing more to do than to exit or to go back
     into the debugger.
  */
  int l = se_position2line(position);
  int c = se_position2column(position);
  int f = se_position2path_id(position);
  char* f1 = "Line : %d column %d in %s.\n";
  char* f2 = "*** Error at Run Time ***: %s\n";

  fprintf(SE_ERR,f1,l,c,p[f]);
  fprintf(SE_ERR,f2,m);
#ifdef SE_EXCEPTIONS
  print_exception();
#endif
#ifdef SE_SEDB
  sedb_break(se_dst,position);
#else
  handle(SE_HANDLE_RUNTIME_ERROR, m);
  se_print_run_time_stack();
  fprintf(SE_ERR,f1,l,c,p[f]);
  fprintf(SE_ERR,f2,m);
  exit(EXIT_FAILURE);
#endif
}

void se_print_string(FILE*stream, EIF_STRING s) {
  /* To print some Eiffel STRING. */
  if (s == NULL) {
    fprintf(stream,"Void");
  }
  else {
    int count = s->_count;
    EIF_CHARACTER* storage = s->_storage;
    int i = 0;
    fprintf(stream,"\"");
    while (count != 0) {
      fprintf(stream,"%c",storage[i]);
      i++;
      count--;
    }
    fprintf(stream,"\"");
  }
}

void se_print_bad_target(FILE*stream, int id, T0* o, int l, int c, int f) {
  /* Print Bad Target Type Error Message. */
  if (l != 0) {
    fprintf(stream,"Line : %d column %d in %s.\n",l,c,p[f]);
  }
  fprintf(stream,"*** Error at Run Time *** :\n");
  fprintf(stream,"   Target is not valid (not the good type).\n");
  fprintf(stream,"   Expected: ");
  se_print_string(stream,t[id]);
  fprintf(stream,", Actual: ");
  se_print_string(stream,t[o->id]);
  fprintf(stream,".\n");
}

void error2(T0*o, se_position position) {
  fprintf(SE_ERR,"Target Type ");
  se_print_string(SE_ERR,t[o->id]);
  fprintf(SE_ERR," is not valid.\n");
  error1("Bad target.",position);
}

T0* vc(T0* o, se_position position) {
  /*
    Void check for reference target.
  */
  if (o != NULL) {
    return o;
  }
  else {
#ifdef SE_EXCEPTIONS
    internal_exception_handler(Void_call_target);
#else
    error1("Call with a Void target.",position);
#endif
    return NULL;
  }
}

T0* se_string_inspect_check(T0* o, se_position position) {
  /*
    Void check for expression of type STRING in inspect.
  */
  if (o != NULL) {
    return o;
  }
  else {
#ifdef SE_EXCEPTIONS
    internal_exception_handler(Incorrect_inspect_value);
#else
    error1("Expression just after \"inspect\" is Void.",position);
#endif
    return NULL;
  }
}

T0* ci(int id, T0* o, se_position position) {
  /*
    Check Id for reference target.
  */
  if ( vc(o,position) != NULL) {
    if ( id == (o->id) ) {
      return o;
    }
    else {
#ifdef SE_EXCEPTIONS
      internal_exception_handler(System_level_type_error);
#else
      int l = se_position2line(position);
      int c = se_position2column(position);
      int f = se_position2path_id(position);

      se_print_bad_target(SE_ERR,id,o,l,c,f);
      se_print_run_time_stack();
      se_print_bad_target(SE_ERR,id,o,l,c,f);
#ifdef SE_SEDB
      sedb_break(se_dst,0);
#else
      exit(EXIT_FAILURE);
#endif
#endif
    }
  }
  return o;
}

void ac_req(int v,char*vv) {
  if (!v) {
#ifdef SE_EXCEPTIONS
    internal_exception_handler(Precondition);
#else
    error0("Require Assertion Violated.",vv);
#endif
  }
}

void ac_ens(int v,char*vv) {
  if (!v) {
#ifdef SE_EXCEPTIONS
    internal_exception_handler(Postcondition);
#else
    error0("Ensure Assertion Violated.",vv);
#endif
  }
}

void ac_inv(int v,char*vv) {
  if (!v) {
#ifdef SE_EXCEPTIONS
    internal_exception_handler(Class_invariant);
#else
    error0("Class Invariant Violation.",vv);
#endif
  }
}

void ac_liv(int v,char*vv) {
  /* Assertion Check : Loop Invariant check. */
  if (!v) {
#ifdef SE_EXCEPTIONS
    internal_exception_handler(Loop_invariant);
#else
    error0("Loop Invariant Violation.",vv);
#endif
  }
}

int ac_lvc(int lc,int lv1,int lv2) {
  /* Assertion Check : Loop Variant check. */
  if (lc == 0) {
    if (lv2 < 0) {
#ifdef SE_EXCEPTIONS
      internal_exception_handler(Loop_variant);
#else
      {
	char msg [64];
	sprintf(msg,"Bad First Variant Value = %d\n",lv2);
	error0(msg,NULL);
      }
#endif
    }
    else {
      return lv2;
    }
  }
  else if ((lv2 < 0) || (lv2 >= lv1)) {
#ifdef SE_EXCEPTIONS
    internal_exception_handler(Loop_variant);
#else
    {
      char msg [512];
      sprintf(msg,
	      "Bad loop variant.\nLoop body counter = %d (done)\n"
	      "Previous Variant = %d\nNew Variant = %d\n",
	      lc,lv1,lv2);
      error0(msg,NULL);
    }
#endif
  }
  return lv2;
}

void ac_civ(int v,char*vv) {
  if (!v) {
#ifdef SE_EXCEPTIONS
    internal_exception_handler(Check_instruction);
#else
    error0("Check Assertion Violated.",vv);
#endif
  }
}

T0* se_evobt(T0* o, se_position position) {
    /*
      Error Void Or Bad Type.
    */
    if (!o) {
#ifdef SE_EXCEPTIONS
	internal_exception_handler(Void_call_target);
#else
	error1("Target is Void.",position);
#endif
    }
    else {
#ifdef SE_EXCEPTIONS
	internal_exception_handler(System_level_type_error);
#else
	error2(o,position);
#endif
    }
    return o; /* Dummy return to avoid C warnings. */
}

void se_signal_handler(int sig) {
  printf("Received signal %d.\n",sig);
#ifdef SE_SEDB
  signal(sig,se_signal_handler);
  sedb_signal_handler(sig);
#else
  se_print_run_time_stack();
  exit(EXIT_FAILURE);
#endif
}

void se_gc_check_id(void*o,int id) {
  if (id != (((T0*)o)->id)) {
#ifdef SE_EXCEPTIONS
    internal_exception_handler(Routine_failure);
#else
    fprintf(SE_ERR,"System-validity error detected during GC cycle.\n");
    se_print_bad_target(SE_ERR,id,(T0*)o,0,0,0);
    se_print_run_time_stack();
    fprintf(SE_ERR,"System-validity error detected during GC cycle.\n");
    se_print_bad_target(SE_ERR,id,(T0*)o,0,0,0);
    exit(EXIT_FAILURE);
#endif
  }
}

se_dump_stack* se_new_dump_stack(se_dump_stack* copy) {
  se_dump_stack* result = NULL;
  se_frame_descriptor* fd;
  int i, j, o, p, n;
  int local_count;
  char* local_format;
  int id;
  void** var;
  int local_size;
  int expanded;

  void*** _i;
  void** _ref;
  char*  _exp;

  if (copy != NULL) {
    fd = copy->fd;
    result = (se_dump_stack*)se_malloc(sizeof(se_dump_stack));
    if (result != NULL) {
      result->fd               = fd;
      result->p                = copy->p;
      result->caller           = copy->caller;
      result->current          = NULL;
      result->locals           = NULL;
      result->exception_origin = NULL;

      if (fd != NULL) {
	local_format = fd->local_format;
	i = 0;
	if (fd->use_current) {
	  result->current = copy->current;
	  /* Place i after the Current definition: */
	  i = 2;
	  id = 0;
	  while (local_format[i] != '%') {
	    id = (id * 10) + (local_format[i++] - '0');
	  }
	  i++;
	}

	/*
	 *
	 * p: sum of the number of pointers ("indirections") per local
	 *    -> 1 for an expanded
	 *    -> 2 for a reference
	 *
	 * o: total malloc'ed size
	 *
	 * _i: access to the first indirection pointer
	 *
	 * _ref: access to the second indirection pointer of a reference object
	 *       _ref == (T0*)(*_i)
	 *
	 * _exp: access to a copy of the expanded object
	 *       _exp == *((char*)_i)
	 *
	 *
	 *
	 * For instance, if "0" is the first local, a reference and "4" is the
	 * second local, an expanded type (say, a 6-byte structure noted
	 * "XXXXXXXXXXX", with 64-bit padding "/"):
	 *
	 *
	 *
	 * result->locals
	 *       |                ------------
	 *       |               |            |
	 *       |    -----------|------------v--------------
	 *        -->| | | | |===+===|===+===|XXXXXXXXXXX|/|/|
	 *           |0|1|2|3|4|5|6|7|8|9|A|B|C|D|E|F|0|1|2|3|
	 *           |===+===| | | | |===+===| | | | | | | | |
	 *            ---|------------^--|-------------------
	 *               |            |  |
	 *                ------------    --------------------------> object
	 *
	 *           |-> _i          |-> _ref         _exp <-|
	 *
	 *
	 *
	 * Note: Those "|->" denote the start value and way of
	 *       progression of the pointers
	 *
	 *
	 * result->locals is defined as a (void***) but its real "type" depends on
	 * which element is accessed (as in the live stack; but in the live stack,
	 * only the first indirection is in the struct; the remaining data is on
	 * the native stack).
	 *
	 */

	if (copy->locals != NULL) {
	  j = i;

	  local_count = local_size = p = o = 0;

	  while (local_count < fd->local_count) {
	    while (local_format[i++] != '%');
	    expanded = ((local_format[i++] == 'E')?1:0);
	    id = 0;
	    while (local_format[i] != '%') {
	      id = (id * 10) + (local_format[i++] - '0');
	    }
	    i++;
	    if (expanded) {
	      p++;
	      o = se_strucT[id];
	      o = (o + 7) & ~7; /* 64-bit align: should be fine for most systems */
	      local_size += o;
	    }
	    else {
	      p+=2;
	    }
	    local_count++;
	  }

	  o = p * sizeof(void*) + local_size;
	  result->locals = (void***)se_malloc(o);
	  _i   = result->locals;
	  _exp = (char*)_i + o;
	  _ref = (void**)_i + local_count;

	  i = j;
	  local_count = 0;
	  while (local_count < fd->local_count) {
	    while (local_format[i++] != '%');
	    expanded = ((local_format[i++] == 'E')?1:0);
	    id = 0;
	    while (local_format[i] != '%') {
	      id = (id * 10) + (local_format[i++] - '0');
	    }
	    i++;
	    var = (copy->locals)[local_count];
	    if (expanded) {
	      o = n = se_strucT[id];
	      o = (o + 7) & ~7; /* 64-bit align: should be fine for most systems */
	      _exp -= o;
	      *(char**)_i = _exp;
	      memset(_exp, 0, o);
	      memcpy(_exp, var, n);
	    }
	    else {
	      *_i = _ref;
	      *_ref = *var;
	      _ref++;
	    }
	    local_count++;
	    _i++;
	  }
	}
      }
    }
  }
  return result;
}

void se_delete_dump_stack(se_dump_stack* ds) {
  if (ds != NULL) {
    if (ds->locals != NULL) free(ds->locals);
    free(ds);
  }
}


void se_print_locals_in(FILE* file, se_dump_stack* ds, int enter) {
  se_frame_descriptor* fd = ds->fd;
  int i = 0;
  int local_count = 0;
  char* local_format;
  int expanded;
  int id;
  void** var;
  int printed = 0;
  int display;

  if (ds->p == 0) return;
  local_format = fd->local_format;
  if (fd->use_current) {
    i = 2;
    id = 0;
    while (local_format[i] != '%') {
      i++;
    }
    i++;
  }
  while (local_count < fd->local_count) {
    display = (strncmp(local_format+i, "Result%", 7)==0) != enter;
    if (display) {
      if (printed)
	fprintf(file,", ");
      else
	fprintf(file,"(");
      printed++;
    }
    
    while (local_format[i] != '%') {
      if (display) fprintf(file,"%c",local_format[i]);
      i++;
    }
    i++;
    expanded = ((local_format[i++] == 'E')?1:0);
    if (display) fprintf(file," = ");
    id = 0;
    while (local_format[i] != '%') {
      id = (id * 10) + (local_format[i] - '0');
      i++;
    }
    i++;
    if (display) {
      if (ds->locals == NULL) {
	fprintf(file,"<unavailable>");
      }
      else {
	var = (ds->locals)[local_count];
	if (expanded) {
	  (se_prinT[id])(file, (void**)(var));
	}
	else if (*var == NULL) {
	  fprintf(file,"Void");
	}
	else {
	  (se_prinT[((T0*)(*var))->id])(file, (void**)(var));
	}
      }
    }
    local_count++;
  }
  if (printed)
    fprintf(file,")\n");
  else
    fprintf(file,"\n");

}

#ifdef SE_TRACE
static int se_call_depth=0;

void se_print_call_trace(se_dump_stack *ds) {
  int i;
  if (ds) {
    int enter = ds->caller == se_dst;
    
    if (enter)
      se_call_depth++;

    if (se_call_depth < 0)
      se_call_depth=0;

    for(i=se_call_depth<<1; i; i--)
      putchar(' ');

    if (enter) {
      printf("enter ");
      printf("%s", ds->fd->name);
      se_print_locals_in(stdout, ds, 1);
    } else {
      if (se_dst) {
	printf("leave ");
	printf("%s", se_dst->fd->name);
	se_print_locals_in(stdout, se_dst, 0);
	se_call_depth--;
      }
    }
  } else {
    for(i=se_call_depth<<1; i; i--)
      putchar(' ');
    printf("leave ");
    printf("%s", se_dst->fd->name);
    se_print_locals_in(stdout, se_dst, 0);
    se_call_depth--;
  }
}
#endif