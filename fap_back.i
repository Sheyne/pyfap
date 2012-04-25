%module fap_back
%{
#include <fap.h>
%}

%include <fap.h>

%include cpointer.i
%pointer_functions(double, double_p)

%include carrays.i
%array_functions(char *, char_array)