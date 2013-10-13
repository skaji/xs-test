#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Test::XS   PACKAGE = Test::XS

PROTOTYPES: DISABLE

void
hello()
PPCODE:
{
    XPUSHs(sv_2mortal(newSVpvs("hello")));
    XSRETURN(1);
}
