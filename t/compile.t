use strict;
use warnings;
use Test::More;
use Test::Alien qw{alien_ok with_subtest xs_ok};
use Alien::HTSlib;

alien_ok 'Alien::HTSlib', 'loads';

my $xs = do { local $/ = undef; <DATA> };
xs_ok { xs => $xs, verbose => $ENV{TEST_VERBOSE} }, with_subtest {
  is CompileTest->check(), 'CompileTest',
    'CompileTest::check() returns CompileTest';
};

done_testing;

__DATA__
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "htslib/hts.h"

MODULE = CompileTest PACKAGE = CompileTest

char *check(class)
  char *class;
  CODE:
    RETVAL = class;
  OUTPUT:
    RETVAL
