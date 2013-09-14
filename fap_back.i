%module fap_back
%{
#include "fap.h"
char *sa_decode_error(fap_error_code_t *err);
char *sa_decode_error(fap_error_code_t *err){
	char buffer[60];
	fap_explain_error(*err, buffer);
	return buffer;
}

%}

%include "fap.h"

%include cpointer.i
%pointer_functions(double, double_p)

%include carrays.i
%array_functions(char *, char_array)

char *sa_decode_error(fap_error_code_t *err);
