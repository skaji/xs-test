#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "add.h"
#include "subst.h"

MODULE = Test::XS   PACKAGE = Test::XS

PROTOTYPES: DISABLE

void
hello()
PPCODE:
{
    int x;
    x = subst(add(10, 5), 5);
    XPUSHs(sv_2mortal(newSViv(x)));
    XSRETURN(1);
}
