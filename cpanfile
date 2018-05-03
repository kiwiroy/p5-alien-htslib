# -*- mode: perl; -*-
requires 'perl' => '5.008009';

on configure => sub {
  requires 'Alien::Build'        => '1.41';
  requires 'Alien::Build::MM'    => '1.41';
  requires 'ExtUtils::MakeMaker' => 0;
};

on build => sub {
  requires 'Alien::Libbz2'   => '0.22';
  requires 'Alien::curl'     => '0.06';
  requires 'HTML::LinkExtor' => 0;
  requires 'IO::Socket::SSL' => 0;
  requires 'Net::SSLeay'     => 0;
  requires 'HTTP::Tiny'      => '0.044';
  requires 'Sort::Versions'  => 0;
  requires 'URI'             => 0;
  requires 'URI::Escape'     => 0;
};

on develop => sub {
  requires 'App::af' => 0;
  requires 'Test::Pod' => 0;
  requires 'Test::Pod::Coverage' => 0;
  requires 'Test::CPAN::Changes' => 0;
};
