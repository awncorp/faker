use 5.014;

use strict;
use warnings;
use routines;

use Test::Auto;
use Test::More;

=name

Faker::Plugin::InternetIpAddressV6

=cut

=abstract

Internet Ip Address V6 Plugin for Faker

=cut

=includes

method: execute

=cut

=synopsis

  package main;

  use Faker;
  use Faker::Plugin::InternetIpAddressV6;

  my $f = Faker->new;
  my $p = Faker::Plugin::InternetIpAddressV6->new(faker => $f);

  my $plugin = $p;

=cut

=inherits

Data::Object::Plugin

=cut

=attributes

faker: ro, req, InstanceOf["Faker"]

=cut

=description

This package provides methods for generating fake internet ip address v6 data.

=cut

=method execute

The execute method returns a random fake internet ip address v6.

=signature execute

execute() : Str

=example-1 execute

  # given: synopsis

  $p->execute;

=cut

package main;

my $test = testauto(__FILE__);

my $subs = $test->standard;

$subs->synopsis(fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'execute', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

ok 1 and done_testing;