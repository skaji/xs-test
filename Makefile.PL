#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => "Test::XS",
    VERSION_FROM => "lib/Test/XS.pm",

    XS     => { "lib/Test/XS.xs" => "lib/Test/XS.c" },
    C      => ["lib/Test/XS.c"],
    OBJECT => '$(O_FILES)',

    INC => "-Iextra",
    MYEXTLIB => 'extra/add.o extra/subst.o',
);


package
    MY;
sub const_cccmd {
    my $self = shift;

    my $cccmd  = $self->SUPER::const_cccmd(@_);
    return q{} unless $cccmd;

    $cccmd .= ' -o $@';

    return $cccmd
}

sub postamble {
    my $self = shift;
    return <<'...';
$(MYEXTLIB):
	cd extra && $(MAKE) object
...
}
