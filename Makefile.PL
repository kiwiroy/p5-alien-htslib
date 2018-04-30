use strict;
use warnings;
use ExtUtils::MakeMaker;
use Alien::Build::MM;
use Alien::curl;
use Config;

my $abmm = Alien::Build::MM->new;

WriteMakefile($abmm->mm_args(
  ABSTRACT_FROM => 'lib/Alien/HTSlib.pm',
  DISTNAME      => 'Alien-HTSlib',
  NAME          => 'Alien::HTSlib',
  VERSION_FROM  => 'lib/Alien/HTSlib.pm',
  MIN_PERL_VERSION => '5.008009',
  META_MERGE => {
    resources => {
      bugtracker => 'https://github.com/kiwiroy/alien-htslib/issues',
      homepage   => 'https://github.com/kiwiroy/alien-htslib',
      repository => 'https://github.com/kiwiroy/alien-htslib.git',
    },
  },
  CONFIGURE_REQUIRES => {
    'Alien::curl'  => 0,
    'Alien::Build' => 0,
  },
  CCFLAGS => Alien::curl->cflags . " $Config{ccflags}",
  LIBS    => [ Alien::curl->libs ],
));

sub MY::postamble {
  $abmm->mm_postamble;
}
