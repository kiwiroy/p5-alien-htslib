use strict;
use warnings;
use Test::More;
use Test::Alien qw{alien_ok with_subtest xs_ok};
use Alien::HTSlib;

alien_ok 'Alien::HTSlib', 'loads';

my $xs = do { local $/ = undef; <DATA> };
xs_ok {
  xs => $xs,
  verbose => $ENV{TEST_VERBOSE},
}, with_subtest {
  is Hts->isremote("t/data/test.sam"), 0,
    'Hts->isremote("local") returns 0';
  is Hts->isremote("https://server.co.nz/test.sam"), 1,
    'Hts->isremote("remote") returns 1';
};

done_testing;

__DATA__
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "htslib/hts.h"

MODULE = Hts PACKAGE = Hts

int isremote(class, filename)
  char *class;
  char *filename;
  CODE:
    RETVAL = hisremote(filename);
  OUTPUT:
    RETVAL
