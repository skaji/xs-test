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

