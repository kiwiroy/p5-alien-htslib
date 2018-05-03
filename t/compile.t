## -*- mode: perl; -*-
use strict;
use warnings;
use Test::More;
use Test::Alien qw{alien_ok with_subtest xs_ok};
use Alien::HTSlib;

alien_ok 'Alien::HTSlib', 'loads';

if ($ENV{TEST_VERBOSE}) {
    diag join ' ', $_, Alien::HTSlib->$_
        for qw( cflags libs libs_static dynamic_libs bin_dir );
}

my $xs = do { local $/ = undef; <DATA> };
xs_ok {
  xs => $xs,
  verbose => $ENV{TEST_VERBOSE},
  cbuilder_compile => {
      # extra_compile_flags = '',
  },
  cbuilder_link => {
      # extra_linker_flags => '',
  },
}, with_subtest {
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
