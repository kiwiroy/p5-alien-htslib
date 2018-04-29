use strict;
use warnings;

use Test::More;
use Test::Alien;
use Alien::HTSlib;

alien_ok 'Alien::HTSlib';

run_ok(['htsfile', '--help'])
  ->success
  ->out_like(qr/^usage:\s+htsfile/mi);

run_ok(['tabix', '--help'])
  ->exit_is(1)
  ->err_like(qr/^usage:\s+tabix/mi);

run_ok(['bgzip', '--help'])
  ->exit_is(1)
  ->err_like(qr/^usage:\s+bgzip/mi);

done_testing;
