%module fap_back
%{
#include <fap.h>
%}

%include <fap.h>

%include cpointer.i
%pointer_functions(double, double_p)
long int long_time(time_t *t);

%{
static long int long_time(time_t *t){
    return (long) *t;
}
%}

%include carrays.i
%array_functions(char *, char_array)