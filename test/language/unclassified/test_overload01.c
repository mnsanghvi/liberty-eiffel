#ifdef __cplusplus
extern "C" {
#endif
/*
ANSI C code generated by SmartEiffel The GNU Eiffel Compiler, Eiffel tools and libraries
Release 2.4 (??? June ??th 2008) [????]
Copyright (C), 1994-2002 - INRIA - LORIA - ESIAL UHP Nancy 1 - FRANCE
Copyright (C), 2003-2005 - INRIA - LORIA - IUT Charlemagne Nancy 2 - FRANCE
D.COLNET, P.RIBET, C.ADRIAN, V.CROIZIER F.MERIZEN - SmartEiffel@loria.fr
http://SmartEiffel.loria.fr
C Compiler options used: -pipe -Os
*/

#ifdef __cplusplus
}
#endif
#include "test_overload01.h"
#ifdef __cplusplus
extern "C" {
#endif
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
  This file (SmartEiffel/sys/runtime/base.c) is included for _all_ modes of
  compilation (-boost, -no_check, ... -all_check).
*/

/*
  Byte swapping function
*/
void copy_swap_16(const uint16_t *src, uint16_t *dest, int count){
  while (count--) {
    *dest++ = (*src << 8) | (*src >> 8);
    src++;
  }
}


/*
  The wrapper for `malloc' (generated C code is supposed to use
  only `se_malloc' instead of direct `malloc').
*/
void* se_malloc(size_t size) {
  void *result = malloc(size);
  if (result == NULL) {
    handle(SE_HANDLE_NO_MORE_MEMORY, NULL);
#ifdef SE_EXCEPTIONS
    internal_exception_handler(No_more_memory);
#elif !defined(SE_BOOST)
    error0("No more memory.", NULL);
#else
  fprintf(SE_ERR,"No more memory (malloc failed).\n");
  exit(EXIT_FAILURE);
#endif
  }
  return result;
}

/*
  The wrapper for `calloc' (generated C code is supposed to use
  only `se_calloc' instead of direct `calloc').
*/
void* se_calloc(size_t nmemb, size_t size) {
  void *result = calloc(nmemb,size);
  if (result == NULL) {
    handle(SE_HANDLE_NO_MORE_MEMORY, NULL);
#ifdef SE_EXCEPTIONS
    internal_exception_handler(No_more_memory);
#elif !defined(SE_BOOST)
    error0("No more memory.", NULL);
#else
  fprintf(SE_ERR,"No more memory (calloc failed).\n");
  exit(EXIT_FAILURE);
#endif
  }
  return result;
}

/*
  The wrapper for `realloc' (generated C code is supposed to use
  only `se_realloc' instead of direct `realloc').
*/
void* se_realloc(void* src, size_t size) {
  void *result = realloc(src, size);
  if (result == NULL) {
    handle(SE_HANDLE_NO_MORE_MEMORY, NULL);
#ifdef SE_EXCEPTIONS
    internal_exception_handler(No_more_memory);
#elif !defined(SE_BOOST)
    error0("No more memory.", NULL);
#else
  fprintf(SE_ERR,"No more memory (realloc failed).\n");
  exit(EXIT_FAILURE);
#endif
  }
  return result;
}

/* ---------------------------------------------------------------------- */

void se_die (int code) {
  handle(SE_HANDLE_DIE_WITH_CODE, &code);
  exit(code);
}

/*
    Runtime hooks
 */

static se_runtime_handler_t** handlers = NULL;
int handlers_count=0;

void register_handler(se_runtime_handler_t*handler) {
  int new_count = handlers_count + 1;
  handlers = (se_runtime_handler_t**)se_realloc(handlers, (new_count) * sizeof(void*));
  handlers[handlers_count] = handler;
  handlers_count = new_count;
}

void _handle(se_handler_action_t action, void*data) {
  int i;
  for (i = 0; i < handlers_count; i++) {
    handlers[i](action, data);
    /* *** Check type of this array. Function pointer may have different size from data pointer. (PH 17/07/08) */
  }
}
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
#if defined __USE_POSIX || defined __unix__ || defined _POSIX_C_SOURCE
/* macro read is used of read_stdin */

void io_copy (char*source, char*target) {
  /* We use the low-level descriptor functions rather than stream-oriented functions.
   * This allows us to copy the file's permissions. */

  int src;
  int tgt;
  struct stat info;
  static char *buffer = NULL;
  static int bufsize = 0;
  int read_count, write_count, written;

  src=open (source, O_RDONLY);
  if (fstat (src, &info))
    return; /* Ooops */
  if (bufsize < info.st_blksize)
    buffer=se_realloc (buffer, info.st_blksize);
  tgt=creat (target, info.st_mode);
  do {
    read_count = read (src, buffer, info.st_blksize);
    write_count = 0; written = 0;
    while  ((write_count < read_count) && (written >= 0))
      {
	written = write (tgt, buffer + write_count, read_count - write_count);
	write_count += written;
      }
  } while ((read_count > 0) && (written >= 0));
  close (src);
  close (tgt);
}

int io_same_physical_file(char*path1,char*path2) {
  struct stat info1, info2;
  if (stat(path1, &info1))
    return 0; /* oops */
  if (stat(path2, &info2))
    return 0; /* oops */
  return (info1.st_dev == info2.st_dev) && (info1.st_ino == info2.st_ino);
}

#else
#define IO_COPY_BUFSIZE 4096

int read_stdin(EIF_CHARACTER *buffer, int size) {
  int c;
  c = getc(stdin);
  if (c==EOF)
    return 0;
  *buffer = (EIF_CHARACTER)c;
  return 1;
}

void io_copy(char*source, char*target) {
  static char *buffer = NULL;
  int read_count;
  FILE*src=fopen(source, "rb");
  FILE*tgt=fopen(target, "wb");

  if(!buffer)
    buffer = (char*)se_malloc(IO_COPY_BUFSIZE);

  while ((read_count = fread(buffer, 1, IO_COPY_BUFSIZE, src)), read_count) {
    size_t dummy = fwrite(buffer, 1, read_count, tgt);
  }
  fclose(src);
  fclose(tgt);
}

int io_same_physical_file(char*path1,char*path2) {
  /* default implementation returns true only if the paths are the same */
  return !strcmp(path1, path2);
}
#endif

int io_file_exists(char*source) {
  FILE*src=fopen(source, "rb");
  if (src!=NULL) {
    fclose(src);
    return 1;
  }
  else {
    return (errno != ENOENT);
  }
}
T53 M53={0};
T7 M7={(void*)0,0,0};
T49 M49={0,(void*)0,0};
T25 M25={0,(void*)0};
/*Aliased storage area or unicode storage.*/
char*s26_0="";
char*s26_212160365="require_check";
char*s26_48390502="all_check";
char*s26_1690381566="invariant_check";
char*s26_1992063831="ensure_check";
char*s26_1325941860="ERROR: \173""EIFFELTEST_TOOLS\175"".assert call ";
char*s26_113001857=" in class ";
char*s26_2167877="number ";
char*s26_718083334="no_check or boost";
char*s26_1075456615="Assertion level was ";
char*s26_265093627="loop_check";
char*s26_1682790378=" failed.\nRerun this test under the -sedb debugger to find out what is going wrong.\n";
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
void se_print_run_time_stack (void) {
  handle(SE_HANDLE_ENTER_PRINT_STACK, NULL);
  fprintf(SE_ERR,"Eiffel program crash at run time.\n");
  fprintf(SE_ERR,"No trace when using option \"-boost\"\n");
  handle(SE_HANDLE_EXIT_PRINT_STACK, NULL);
}

void se_signal_handler(int sig) {
  handle(SE_HANDLE_RUNTIME_ERROR, NULL);
  printf("Received signal %d.\n",sig);
  se_print_run_time_stack();
  exit(EXIT_FAILURE);
}

/*INTEGER_32*/void r2append_in(T2 C,T0* a1){
T2 _val=0;
T2 _i=0;
T2 _idx=0;
if((C)==(INT8_C(0))){
r7extend(((T7*)a1),((T3)'0'));
}
else{
if(((int32_t)(C))>(INT32_C(0))){
_val=C;
_i=((int32_t)((/*RF2*/(((T7*)a1))->_count/*3p*/)))+(INT32_C(1));
}
else{
r7extend(((T7*)a1),((T3)'\055'));
_i=((int32_t)((/*RF2*/(((T7*)a1))->_count/*3p*/)))+(INT32_C(1));
_val=((int32_t)(C))%(INT32_C(10));
if(((int32_t)(_val))<=(INT32_C(0))){
r7extend(((T7*)a1),r2decimal_digit(-(_val)));
_val=-(((int32_t)(C))/(INT32_C(10)));
}
else{
r7extend(((T7*)a1),r2decimal_digit(((int32_t)(-(_val)))+(INT32_C(10))));
_val=((int32_t)(-(((int32_t)(C))/(INT32_C(10)))))-(INT32_C(1));
}
}
while(!((_val)==(INT8_C(0))))
{
r7extend(((T7*)a1),r2decimal_digit(((int32_t)(_val))%(INT32_C(10))));
_val=((int32_t)(_val))/(INT32_C(10));
}
_idx=(/*RF2*/(((T7*)a1))->_count/*3p*/);
while(!(((int32_t)(_i))>=(_idx)))
{
r7swap(((T7*)a1),_i,_idx);
_idx=((int32_t)(_idx))-(INT32_C(1));
_i=((int32_t)(_i))+(INT32_C(1));
}
}
}/*--*/

/*INTEGER_32*/T3 r2decimal_digit(T2 C){
T3 R=0;
R=((T3)(((int32_t)(C))+(INT32_C(48))));
return R;
}/*--*/

/*INTEGER_32*/T2 r2max(T2 C,T2 a1){
T2 R=0;
if(((int32_t)(C))>=(a1)){
R=C;
}
else{
R=a1;
}
return R;
}/*--*/

/*NATIVE_ARRAY[CHARACTER]*/T9 r9realloc(T9 C,T2 a1,T2 a2){
T9 R=(void*)0;
R=((T9)(se_calloc(a2,sizeof(T3))));
r9copy_from(R,C,((int32_t)(a1))-(INT32_C(1)));
return R;
}/*--*/

/*NATIVE_ARRAY[CHARACTER]*/void r9copy_from(T9 C,T9 a1,T2 a2){
T2 _i=0;
_i=a2;
while(!(((int32_t)(_i))<(INT32_C(0))))
{
(C)[_i]=((a1)[_i]);
_i=((int32_t)(_i))-(INT32_C(1));
}
}/*--*/

/*NATIVE_ARRAY[CHARACTER]*/void r9clear_all(T9 C,T2 a1){
T3 _v=0;
T2 _i=0;
_i=a1;
while(!(((int32_t)(_i))<(INT32_C(0))))
{
(C)[_i]=(_v);
_i=((int32_t)(_i))-(INT32_C(1));
}
}/*--*/

/*STRING*/void r7swap(T7* C,T2 a1,T2 a2){
T3 _tmp=0;
_tmp=r7item(C,a1);
r7put(C,r7item(C,a2),a1);
r7put(C,_tmp,a2);
}/*--*/

/*STRING*/T3 r7item(T7* C,T2 a1){
T3 R=0;
R=((/*RF2*/(C)->_storage/*3p*/))[((int32_t)(a1))-(INT32_C(1))];
return R;
}/*--*/

/*STRING*/void r7copy(T7* C,T0* a1){
T2 _c=0;
_c=(/*RF2*/(((T7*)a1))->_count/*3p*/);
if(((int32_t)(_c))>(INT32_C(0))){
if(((int32_t)((/*RF2*/(C)->_capacity/*3p*/)))<(_c)){
/*SFN*/(C->_storage/*3p*/)=((T9)(se_calloc(_c,sizeof(T3))));
/*SFN*/(C->_capacity/*3p*/)=_c;
}
r9copy_from((/*RF2*/(C)->_storage/*3p*/),(/*RF2*/(((T7*)a1))->_storage/*3p*/),((int32_t)(_c))-(INT32_C(1)));
}
/*SFN*/(C->_count/*3p*/)=_c;
}/*--*/

/*STRING*/void r7put(T7* C,T3 a1,T2 a2){
((/*RF2*/(C)->_storage/*3p*/))[((int32_t)(a2))-(INT32_C(1))]=(a1);
}/*--*/

/*STRING*/void r7extend(T7* C,T3 a1){
if(((/*RF2*/(C)->_count/*3p*/))==((/*RF2*/(C)->_capacity/*3p*/))){
r7ensure_capacity(C,((int32_t)((/*RF2*/(C)->_count/*3p*/)))+(INT32_C(1)));
}
((/*RF2*/(C)->_storage/*3p*/))[(/*RF2*/(C)->_count/*3p*/)]=(a1);
/*SFN*/(C->_count/*3p*/)=((int32_t)((/*RF2*/(C)->_count/*3p*/)))+(INT32_C(1));
}/*--*/

/*STRING*/void r7ensure_capacity(T7* C,T2 a1){
T2 _new_capacity=0;
if(((NULL!=((void*)((/*RF2*/(C)->_storage/*3p*/)))))==(0)){
_new_capacity=r2max(a1,INT32_C(32));
/*SFN*/(C->_storage/*3p*/)=((T9)(se_calloc(_new_capacity,sizeof(T3))));
/*SFN*/(C->_capacity/*3p*/)=_new_capacity;
}
else{
if(((int32_t)((/*RF2*/(C)->_capacity/*3p*/)))<(a1)){
_new_capacity=r2max(a1,(int32_t)(((uint32_t)((/*RF2*/(C)->_capacity/*3p*/)))*((uint32_t)(INT32_C(2)))));
/*SFN*/(C->_storage/*3p*/)=r9realloc((/*RF2*/(C)->_storage/*3p*/),(/*RF2*/(C)->_capacity/*3p*/),_new_capacity);
/*SFN*/(C->_capacity/*3p*/)=_new_capacity;
}
}
}/*--*/

/*COUNTER*/void r53increment(T53* C){
/*SFN*/(C->_value/*p*/)=((int32_t)((/*RF2*/(C)->_value/*p*/)))+(INT32_C(1));
}/*--*/
T0*oBC13std_output=(void*)0;
int fBC13std_output=0;

/*STD_OUTPUT*/T0* r49std_output(void){
/*[INTERNAL_C_LOCAL list*/
T0* tmp0;
/*INTERNAL_C_LOCAL list]*/
if(fBC13std_output==0){fBC13std_output=1;{
tmp0/*new*/=((T0*)se_malloc(sizeof(T49)))/*3p*/;
*((T49*)tmp0/*new*/)=M49;
r49make(((T49*)tmp0/*new*/));
oBC13std_output=tmp0/*new*/;
/*tmp0.unlock*/
}}
return oBC13std_output;
}/*--*/

/*STD_OUTPUT*/void r49filtered_flush(T49* C){
if(((int32_t)((/*RF2*/(C)->_buffer_position/*3p*/)))>(INT32_C(0))){
r49write_buffer(C);
}
io_flush((stdout));
}/*--*/

/*STD_OUTPUT*/void r49filtered_put_character(T49* C,T3 a1){
if(((int32_t)((/*RF2*/(C)->_buffer_position/*3p*/)))>=(INT32_C(4096))){
r49write_buffer(C);
}
((/*RF2*/(C)->_buffer/*3p*/))[(/*RF2*/(C)->_buffer_position/*3p*/)]=(a1);
/*SFN*/(C->_buffer_position/*3p*/)=((int32_t)((/*RF2*/(C)->_buffer_position/*3p*/)))+(INT32_C(1));
if((a1)==(((T3)'\n'))){
r49write_buffer(C);
}
}/*--*/

/*STD_OUTPUT*/void r49se_atexit(void){
r49filtered_flush((T49*)(r49std_output()));
}/*--*/

/*STD_OUTPUT*/void r49make(T49* C){
/*SFN*/(C->_buffer/*3p*/)=((T9)(se_calloc(INT32_C(4096),sizeof(T3))));
/*SFN*/(C->_capacity/*3p*/)=INT32_C(4096);
}/*--*/

/*STD_OUTPUT*/void r49write_buffer(T49* C){
T2 _unused_result=0;
if(((int32_t)((/*RF2*/(C)->_buffer_position/*3p*/)))>(INT32_C(0))){
_unused_result=io_fwrite((/*RF2*/(C)->_buffer/*3p*/),(/*RF2*/(C)->_buffer_position/*3p*/),(stdout));
/*SFN*/(C->_buffer_position/*3p*/)=INT32_C(0);
}
}/*--*/

/*STD_OUTPUT*/void r49flush(T49* C){
r49filtered_flush(C);
}/*--*/

/*STD_OUTPUT*/void r49put_string(T49* C,T0* a1){
T2 _i=0;
T2 _count=0;
_i=INT32_C(1);
_count=(/*RF2*/(((T7*)a1))->_count/*3p*/);
while(!(((int32_t)(_i))>(_count)))
{
r49filtered_put_character(C,r7item(((T7*)a1),_i));
_i=((int32_t)(_i))+(INT32_C(1));
}
}/*--*/

/*TEST_OVERLOAD01*/void r25default_create(T25* C){
/*SFN*/(C->_external_object/*2p*/)=r25cpp_new();
r25set_value(C,INT32_C(25));
r25label_assert(C,(void*)0,(T6)((r25value(C))==(INT8_C(25))));
}/*--*/

/*TEST_OVERLOAD01*/T0* r25std_output(void){
/*[INTERNAL_C_LOCAL list*/
T0* tmp0;
/*INTERNAL_C_LOCAL list]*/
if(fBC13std_output==0){fBC13std_output=1;{
tmp0/*new*/=((T0*)se_malloc(sizeof(T49)))/*3p*/;
*((T49*)tmp0/*new*/)=M49;
r49make(((T49*)tmp0/*new*/));
oBC13std_output=tmp0/*new*/;
/*tmp0.unlock*/
}}
return oBC13std_output;
}/*--*/
T0*oBC26assert_counter=(void*)0;

/*TEST_OVERLOAD01*/T0* r25assertion_flag(T25* C){
/*[INTERNAL_C_LOCAL list*/
T2 tmp0;
/*INTERNAL_C_LOCAL list]*/
T0* R=(void*)0;
tmp0/*inspectExpression*/=(/*RF2*/(C)->_assertion_level/*2p*/);
/*[inspect*/
switch(tmp0/*inspectExpression*/){
case 5:
R=ms26_48390502;
break;
case 4:
R=ms26_265093627;
break;
case 3:
R=ms26_1690381566;
break;
case 2:
R=ms26_1992063831;
break;
case 1:
R=ms26_212160365;
break;
default:;
R=ms26_718083334;
}
/*inspect]*/
return R;
}/*--*/

/*TEST_OVERLOAD01*/void r25label_assert(T25* C,T0* a1,T6 a2){
T0* _actual_label=(void*)0;
r53increment(((T53*)oBC26assert_counter));
if((a2)==(0)){
if((a1)!=((void*)((void*)0))){
_actual_label=a1;
}
else{
_actual_label=ms26_0;
r7copy(((T7*)_actual_label),ms26_2167877);
r2append_in((/*RF2*/(((T53*)oBC26assert_counter))->_value/*p*/),_actual_label);
}
r49put_string((T49*)(r25std_output()),ms26_1325941860);
r49put_string((T49*)(r25std_output()),_actual_label);
r49put_string((T49*)(r25std_output()),ms26_113001857);
r49put_string((T49*)(r25std_output()),(T0*)(g[25]));
r49put_string((T49*)(r25std_output()),ms26_1682790378);
r49put_string((T49*)(r25std_output()),ms26_1075456615);
r49put_string((T49*)(r25std_output()),r25assertion_flag(C));
r49filtered_put_character((T49*)(r25std_output()),((T3)'\056'));
r49filtered_put_character((T49*)(r25std_output()),((T3)'\n'));
}
}/*--*/

/*TEST_OVERLOAD01*/T2 r25value(T25* C){
T2 R=0;
R=r25cpp_value((/*RF2*/(C)->_external_object/*2p*/));
return R;
}/*--*/
/* Extra external prototype for line 44 of /home/cyril/SmartEiffel/se/trunk/test_suite/language/unclassified/test_overload01.e:*/
void cpp25cpp_set_value(T8 a1,T2 a2);

/*TEST_OVERLOAD01*/void r25cpp_set_value(T8 a1,T2 a2){
cpp25cpp_set_value(a1,a2);
}/*--*/
/* Extra external prototype for line 51 of /home/cyril/SmartEiffel/se/trunk/test_suite/language/unclassified/test_overload01.e:*/
T8 cpp25cpp_new(void);

/*TEST_OVERLOAD01*/T8 r25cpp_new(void){
T8 R=(void*)0;
R=cpp25cpp_new();
return R;
}/*--*/
/* Extra external prototype for line 37 of /home/cyril/SmartEiffel/se/trunk/test_suite/language/unclassified/test_overload01.e:*/
T2 cpp25cpp_value(T8 a1);

/*TEST_OVERLOAD01*/T2 r25cpp_value(T8 a1){
T2 R=0;
R=cpp25cpp_value(a1);
return R;
}/*--*/

/*TEST_OVERLOAD01*/void r25set_value(T25* C,T2 a1){
r25cpp_set_value((/*RF2*/(C)->_external_object/*2p*/),a1);
}/*--*/
T0*ms26_718083334;
T0*ms26_2167877;
T0*ms26_1992063831;
T0*ms26_1325941860;
T0*ms26_0;
T0*ms26_1690381566;
T0*ms26_113001857;
T0*ms26_265093627;
T0*ms26_212160365;
T0*ms26_48390502;
T0*ms26_1682790378;
T0*ms26_1075456615;

T0*se_ms(int c,char*e){
/* Allocate a Manifest STRING.*/
T7*s=((T7*)se_malloc(sizeof(T7)));
s->_count=c;
s->_capacity=c+1;
s->_storage=((T9)se_malloc(c+1));
memcpy(s->_storage,e,c+1);
return((T0*)s);}/*--*/

T0*se_string(char*e){
/* Allocate an Eiffel STRING by copying C char*e */
int c=strlen(e);
T7*s=((T7*)se_malloc(sizeof(T7)));
s->_count=c;
s->_capacity=c+1;
s->_storage=((T9)se_malloc(c+1));
memcpy(s->_storage,e,c+1);
return((T0*)s);}/*--*/

void se_msi1(void){
ms26_718083334=se_ms(17,s26_718083334);
ms26_2167877=se_ms(7,s26_2167877);
ms26_1992063831=se_ms(12,s26_1992063831);
ms26_1325941860=se_ms(38,s26_1325941860);
ms26_0=se_ms(0,s26_0);
ms26_1690381566=se_ms(15,s26_1690381566);
ms26_113001857=se_ms(10,s26_113001857);
ms26_265093627=se_ms(10,s26_265093627);
ms26_212160365=se_ms(13,s26_212160365);
ms26_48390502=se_ms(9,s26_48390502);
ms26_1682790378=se_ms(83,s26_1682790378);
ms26_1075456615=se_ms(20,s26_1075456615);
}/*--*/
T25*eiffel_root_object=(void*)0;
int se_argc;
char**se_argv;
T7*g[164];

void se_atexit(void){
r49se_atexit();
}/*--*/

void initialize_eiffel_runtime(int argc,char*argv[]){
/*[INTERNAL_C_LOCAL list*/
T0* tmp0;
/*INTERNAL_C_LOCAL list]*/
se_argc=argc;
se_argv=argv;
atexit(se_atexit);
g[25]=(T7*)se_string("TEST_OVERLOAD01");
g[85]=(T7*)se_string("PROCEDURE");
g[101]=(T7*)se_string("MEMORY");
g[15]=(T7*)se_string("TUPLE 1");
g[16]=(T7*)se_string("TUPLE 2");
g[76]=(T7*)se_string("ROUTINE");
g[17]=(T7*)se_string("TUPLE 3");
g[18]=(T7*)se_string("TUPLE 4");
g[19]=(T7*)se_string("TUPLE 5");
g[20]=(T7*)se_string("TUPLE 6");
g[21]=(T7*)se_string("TUPLE 7");
g[22]=(T7*)se_string("TUPLE 8");
g[23]=(T7*)se_string("TUPLE 9");
g[14]=(T7*)se_string("TUPLE");
g[24]=(T7*)se_string("TUPLE 10");
g[8]=(T7*)se_string("POINTER");
g[153]=(T7*)se_string("REFERENCE");
g[75]=(T7*)se_string("FUNCTION");
g[6]=(T7*)se_string("BOOLEAN");
g[56]=(T7*)se_string("SAFE_EQUAL");
g[13]=(T7*)se_string("ANY");
g[122]=(T7*)se_string("WEAK_REFERENCE");
g[38]=(T7*)se_string("PLATFORM");
g[84]=(T7*)se_string("INTERNALS_HANDLER");
g[105]=(T7*)se_string("NATIVE_ARRAY_INTERNALS");
g[47]=(T7*)se_string("TYPED_INTERNALS");
g[78]=(T7*)se_string("NATIVE_ARRAY_COLLECTOR");
g[48]=(T7*)se_string("INTERNALS");
g[74]=(T7*)se_string("COLLECTION");
g[94]=(T7*)se_string("STACK");
g[107]=(T7*)se_string("SIMPLE_DICTIONARY");
g[108]=(T7*)se_string("DICTIONARY");
g[92]=(T7*)se_string("FAST_ARRAY");
g[77]=(T7*)se_string("ARRAY");
g[106]=(T7*)se_string("HASHED_DICTIONARY");
g[55]=(T7*)se_string("NATIVE_ARRAY");
g[114]=(T7*)se_string("STRING_RECYCLING_ITEM");
g[93]=(T7*)se_string("RECYCLING_POOL");
g[100]=(T7*)se_string("STRING_RECYCLING_POOL");
g[140]=(T7*)se_string("STRING_RECYCLING_ITEM_SORTER");
g[121]=(T7*)se_string("ANY_HASHED_DICTIONARY_NODE");
g[79]=(T7*)se_string("ARRAYED_COLLECTION");
g[120]=(T7*)se_string("HASHED_DICTIONARY_NODE");
g[109]=(T7*)se_string("HASH_TABLE_SIZE");
g[130]=(T7*)se_string("DIRECTORY_NOTATION");
g[54]=(T7*)se_string("FILTER");
g[27]=(T7*)se_string("OUTPUT_STREAM");
g[148]=(T7*)se_string("PATH_NAME");
g[82]=(T7*)se_string("FILTER_INPUT_STREAM");
g[40]=(T7*)se_string("TERMINAL_OUTPUT_STREAM");
g[154]=(T7*)se_string("FILE_TOOLS");
g[44]=(T7*)se_string("TERMINAL_INPUT_STREAM");
g[43]=(T7*)se_string("TERMINAL_INPUT_OUTPUT_STREAM");
g[71]=(T7*)se_string("FILTER_OUTPUT_STREAM");
g[45]=(T7*)se_string("INPUT_STREAM");
g[28]=(T7*)se_string("STREAM");
g[66]=(T7*)se_string("FILE");
g[65]=(T7*)se_string("TEXT_FILE_READ");
g[126]=(T7*)se_string("TEXT_FILE_READ_WRITE");
g[42]=(T7*)se_string("STD_INPUT_OUTPUT");
g[39]=(T7*)se_string("STD_ERROR");
g[124]=(T7*)se_string("TEXT_FILE_WRITE");
g[50]=(T7*)se_string("STD_INPUT");
g[49]=(T7*)se_string("STD_OUTPUT");
g[46]=(T7*)se_string("INPUT_STREAM_TOOLS");
g[32]=(T7*)se_string("OUTPUT_STREAM_TOOLS");
g[41]=(T7*)se_string("REDIRECTION_TOOLS");
g[147]=(T7*)se_string("BASIC_DIRECTORY");
g[150]=(T7*)se_string("UNIXISH_PATH_NAME");
g[31]=(T7*)se_string("FILTERABLE");
g[129]=(T7*)se_string("PATH_JOINER");
g[149]=(T7*)se_string("POSIX_PATH_NAME");
g[128]=(T7*)se_string("PATH_NAME_NOTATION");
g[157]=(T7*)se_string("MACINTOSH_DIRECTORY_NOTATION");
g[158]=(T7*)se_string("OPENVMS_DIRECTORY_NOTATION");
g[161]=(T7*)se_string("MICROSOFT_PATH_NAME");
g[160]=(T7*)se_string("WINDOWS_DIRECTORY_NOTATION");
g[127]=(T7*)se_string("UNIX_DIRECTORY_NOTATION");
g[159]=(T7*)se_string("AMIGA_DIRECTORY_NOTATION");
g[162]=(T7*)se_string("CYGWIN_DIRECTORY_NOTATION");
g[156]=(T7*)se_string("UNICODE_STRING_HANDLER");
g[73]=(T7*)se_string("ITERATOR");
g[103]=(T7*)se_string("ITERATOR_ON_TRAVERSABLE");
g[95]=(T7*)se_string("ITERATOR_ON_UNICODE_STRING");
g[119]=(T7*)se_string("ITERATOR_ON_DICTIONARY_ITEMS");
g[81]=(T7*)se_string("ITERATOR_ON_STRING");
g[123]=(T7*)se_string("ITERATOR_ON_DICTIONARY_KEYS");
g[141]=(T7*)se_string("ABSTRACT_SORTER");
g[53]=(T7*)se_string("COUNTER");
g[26]=(T7*)se_string("EIFFELTEST_TOOLS");
g[104]=(T7*)se_string("MINI_PARSER_BUFFER");
g[102]=(T7*)se_string("EVENTS_SET");
g[69]=(T7*)se_string("EVENT_DESCRIPTOR");
g[83]=(T7*)se_string("CAN_READ_DATA_FROM_STREAM");
g[146]=(T7*)se_string("NETWORK_CONNECTION_OCCURRED");
g[70]=(T7*)se_string("STREAM_EXCEPTION");
g[72]=(T7*)se_string("CAN_WRITE_DATA_TO_STREAM");
g[30]=(T7*)se_string("RECYCLABLE");
g[29]=(T7*)se_string("DISPOSABLE");
g[34]=(T7*)se_string("TRAVERSABLE");
g[37]=(T7*)se_string("HASHABLE");
g[35]=(T7*)se_string("STORABLE");
g[36]=(T7*)se_string("COMPARABLE");
g[12]=(T7*)se_string("REAL_EXTENDED");
g[59]=(T7*)se_string("REAL_GENERAL");
g[62]=(T7*)se_string("NATURAL_64");
g[2]=(T7*)se_string("INTEGER_32");
g[63]=(T7*)se_string("NUMBER");
g[4]=(T7*)se_string("REAL_32");
g[1]=(T7*)se_string("INTEGER_8");
g[88]=(T7*)se_string("MUTABLE_BIG_INTEGER");
g[11]=(T7*)se_string("INTEGER_64");
g[80]=(T7*)se_string("NUMBER_TOOLS");
g[51]=(T7*)se_string("INTEGER_GENERAL");
g[5]=(T7*)se_string("REAL_64");
g[57]=(T7*)se_string("NATURAL_16");
g[52]=(T7*)se_string("NUMERIC");
g[61]=(T7*)se_string("NATURAL_32");
g[60]=(T7*)se_string("NATURAL_8");
g[58]=(T7*)se_string("NATURAL_GENERAL");
g[10]=(T7*)se_string("INTEGER_16");
g[89]=(T7*)se_string("FRACTION_WITH_BIG_INTEGER_NUMBER");
g[86]=(T7*)se_string("INTEGER_64_NUMBER");
g[87]=(T7*)se_string("INTEGER_GENERAL_NUMBER");
g[90]=(T7*)se_string("FRACTION_GENERAL_NUMBER");
g[91]=(T7*)se_string("BIG_INTEGER_NUMBER");
g[64]=(T7*)se_string("UNICODE_STRING");
g[3]=(T7*)se_string("CHARACTER");
g[7]=(T7*)se_string("STRING");
g[33]=(T7*)se_string("STRING_HANDLER");
g[163]=(T7*)se_string("TIME_FORMATTER");
g[142]=(T7*)se_string("TIME");
g[115]=(T7*)se_string("MICROSECOND_TIME");
g[143]=(T7*)se_string("TIME_HANDLER");
g[67]=(T7*)se_string("URL");
g[135]=(T7*)se_string("ADDRESS");
g[97]=(T7*)se_string("PROTOCOL");
g[99]=(T7*)se_string("RESOURCE_LOCATOR");
g[133]=(T7*)se_string("ACCESS");
g[136]=(T7*)se_string("SOCKET_INPUT_OUTPUT_STREAM");
g[96]=(T7*)se_string("PROTOCOLS");
g[68]=(T7*)se_string("URL_VALIDITY");
g[134]=(T7*)se_string("HOST");
g[152]=(T7*)se_string("IP_ADDRESS");
g[132]=(T7*)se_string("TCP_ACCESS");
g[116]=(T7*)se_string("SOCKET_SERVER");
g[151]=(T7*)se_string("CLIENT_SOCKET_INPUT_OUTPUT_STREAM");
g[145]=(T7*)se_string("SERVER_SOCKET_INPUT_OUTPUT_STREAM");
g[117]=(T7*)se_string("SOCKET_PLUG_IN");
g[118]=(T7*)se_string("SOCKET_HANDLER");
g[144]=(T7*)se_string("SOCKET");
g[98]=(T7*)se_string("STREAM_PROTOCOL");
g[138]=(T7*)se_string("HTTP_CLIENT_INPUT_STREAM");
g[110]=(T7*)se_string("FILE_PROTOCOL");
g[111]=(T7*)se_string("HTTP_PROTOCOL");
g[112]=(T7*)se_string("TCP_PROTOCOL");
g[137]=(T7*)se_string("HTTP_PROXY");
g[139]=(T7*)se_string("HTTP_CLIENT_OUTPUT_STREAM");
g[125]=(T7*)se_string("FILE_RESOURCE_LOCATOR");
g[113]=(T7*)se_string("NETWORK_RESOURCE_VALIDITY");
g[131]=(T7*)se_string("NETWORK_RESOURCE_LOCATOR");
g[155]=(T7*)se_string("SYSTEM");
g[9]=g[55];
#ifdef SIGQUIT
signal(SIGQUIT,se_signal_handler);
#endif
#ifdef SIGILL
signal(SIGILL,se_signal_handler);
#endif
#ifdef SIGABRT
signal(SIGABRT,se_signal_handler);
#endif
#ifdef SIGFPE
signal(SIGFPE,se_signal_handler);
#endif
#ifdef SIGSEGV
signal(SIGSEGV,se_signal_handler);
#endif
#ifdef SIGBUS
signal(SIGBUS,se_signal_handler);
#endif
#ifdef SIGSYS
signal(SIGSYS,se_signal_handler);
#endif
#ifdef SIGTRAP
signal(SIGTRAP,se_signal_handler);
#endif
#ifdef SIGXCPU
signal(SIGXCPU,se_signal_handler);
#endif
#ifdef SIGXFSZ
signal(SIGXFSZ,se_signal_handler);
#endif
se_msi1();
/*PCO*/
tmp0/*new*/=((T0*)se_malloc(sizeof(T53)))/*p*/;
*((T53*)tmp0/*new*/)=M53;
oBC26assert_counter=tmp0/*new*/;
/*tmp0.unlock*/
/*reusing tmp0*/tmp0/*root*/=((T0*)se_malloc(sizeof(T25)))/*2p*/;
*((T25*)tmp0/*root*/)=M25;
eiffel_root_object=((T25*)tmp0/*root*/);
/*tmp0.unlock*/
}/*--*/

int main(int argc,char*argv[]){
/*[INTERNAL_C_LOCAL list*/
T0* tmp0;
/*INTERNAL_C_LOCAL list]*/
initialize_eiffel_runtime(argc,argv);
tmp0/*prof*/=((T0*)eiffel_root_object);
r25default_create(((T25*)tmp0/*prof*/));
handle(SE_HANDLE_NORMAL_EXIT, NULL);
/*tmp0.unlock*/
exit(0);
return 0;
}/*--*/

#ifdef __cplusplus
}
#endif