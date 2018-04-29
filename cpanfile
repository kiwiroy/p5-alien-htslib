# -*- mode: perl; -*-
requires 'perl' => '5.008009';
requires 'Alien::Base' => 0;
requires 'Alien::curl' => '0.06';
requires 'HTML::LinkExtor' => 0;

on develop => sub {
  requires 'App::af' => 0;
  requires 'Test::Pod' => 0;
  requires 'Test::Pod::Coverage' => 0;
  requires 'Test::CPAN::Changes' => 0;
};
