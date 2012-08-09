%module fap_back
%{
#include <fap.h>
%}

%include cpointer.i
%include carrays.i
%include <fap.h>

%pointer_functions(double, double_p)
%array_functions(char *, char_array)
long int long_time(time_t *t);
char *sa_decode_error(fap_error_code_t *err);

%{
static long int long_time(time_t *t){
    return (long) *t;
}

char *sa_decode_error(fap_error_code_t *err);
char *sa_decode_error(fap_error_code_t *err){
    char buffer[60];
    fap_explain_error(*err, buffer);
    return buffer;
}
%}

