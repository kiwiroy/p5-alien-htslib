use strict;
use warnings;
use ExtUtils::MakeMaker;
use Alien::Build::MM;
use Alien::Libbz2;
use Alien::curl;
use Alien::xz;
use Alien::libdeflate;
use Alien::Base::Wrapper qw( Alien::Libbz2 Alien::curl Alien::xz Alien::libdeflate !export );
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
      bugtracker => 'https://github.com/kiwiroy/p5-alien-htslib/issues',
      homepage   => 'https://github.com/kiwiroy/p5-alien-htslib',
      repository => 'https://github.com/kiwiroy/p5-alien-htslib.git',
    },
  },
  CONFIGURE_REQUIRES => {
    'Alien::Libbz2'     => '0.22',
    'Alien::curl'       => '0.06',
    'Alien::xz'         => '0.07',
    'Alien::Build'      => '1.41',
    'Alien::libdeflate' => '0.01',
  },
  Alien::Base::Wrapper->mm_args,
));

sub MY::postamble {
  $abmm->mm_postamble;
}
