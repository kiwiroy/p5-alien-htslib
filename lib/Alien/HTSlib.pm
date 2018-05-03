package Alien::HTSlib;

use strict;
use warnings;
use base qw{ Alien::Base };

our $VERSION = '0.04';

# sub cflags { shift->cflags_static; }
# sub libs   { shift->libs_static;   }

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Alien::HTSlib - Fetch/build/stash the HTSlib headers and libs from http://htslib.org.

=head1 SYNOPSIS

Access to paths where the library is installed.

  use Alien::HTSlib;

  ## distribution directory
  Alien::HTSlib->dist_dir;

  ## directory for $PATH where bgzip, htsfile and tabix are found
  Alien::HTSlib->bin_dir;

  ## compile and linker options
  Alien::HTSlib->cflags;
  Alien::HTSlib->libs;

Using L<ExtUtils::MakeMaker> and C<Makefile.PL>.

  use Alien::HTSlib;
  use ExtUtils::MakeMaker;
  use Alien::Base::Wrapper qw( Alien::HTSlib !export );
  use Config;

  WriteMakefile(
    # ...
    Alien::Base::Wrapper->mm_args,
    # ...
    );

=head1 DESCRIPTION

Download, build, and install the HTSlib C headers and libraries into a
well-known location, C<<< Alien::HTSlib->dist_dir >>>, from whence other
packages can make use of them.

The version installed will be the latest release on the master branch from
the HTSlib GitHub repo.

=head1 AUTHOR

Rishi Nag

=head1 COPYRIGHT AND LICENSE

Copyright [1999-2016] Wellcome Trust Sanger Institute and the EMBL-European Bioinformatics Institute

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut
