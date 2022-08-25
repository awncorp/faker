package main;

use 5.018;

use strict;
use warnings;

use Test::More;
use Venus::Test;

my $test = test(__FILE__);
my $seed = 42;

=name

Faker::Plugin::EnUs::AddressNumber

=cut

$test->for('name');

=tagline

Address Number

=cut

$test->for('tagline');

=abstract

Address Number for Faker

=cut

$test->for('abstract');

=includes

method: new
method: execute

=cut

$test->for('includes');

=synopsis

  package main;

  use Faker::Plugin::EnUs::AddressNumber;

  my $plugin = Faker::Plugin::EnUs::AddressNumber->new;

  # bless(..., "Faker::Plugin::EnUs::AddressNumber")

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::EnUs::AddressNumber');

  $result
});

=description

This package provides methods for generating fake data for address number.

+=encoding utf8

=cut

$test->for('description');

=inherits

Faker::Plugin::EnUs

=cut

$test->for('inherits');

=method execute

The execute method returns a returns a random fake address number.

=signature execute

  execute(HashRef $data) (Str)

=metadata execute

{
  since => '1.10',
}

=example-1 execute

  package main;

  use Faker::Plugin::EnUs::AddressNumber;

  my $plugin = Faker::Plugin::EnUs::AddressNumber->new;

  # bless(..., "Faker::Plugin::EnUs::AddressNumber")

  # my $result = $plugin->execute;

  # 8140;

  # my $result = $plugin->execute;

  # 5684;

  # my $result = $plugin->execute;

  # 57694;

=cut

$test->for('example', 1, 'execute', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::EnUs::AddressNumber');
  ok $result->faker;
  ok $result->faker->random->reseed($seed);
  ok $result->faker->random->make; # reset randomizer
  is $result->execute, 8140;
  ok $result->faker->random->make; # reset randomizer
  is $result->execute, 5684;
  ok $result->faker->random->make; # reset randomizer
  is $result->execute, 57694;

  $result
});

=method new

The new method returns a new instance of the class.

=signature new

  new(HashRef $data) (Plugin)

=metadata new

{
  since => '1.10',
}

=example-1 new

  package main;

  use Faker::Plugin::EnUs::AddressNumber;

  my $plugin = Faker::Plugin::EnUs::AddressNumber->new;

  # bless(..., "Faker::Plugin::EnUs::AddressNumber")

=cut

$test->for('example', 1, 'new', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::EnUs::AddressNumber');
  ok $result->faker;

  $result
});

# END

$test->render('lib/Faker/Plugin/EnUs/AddressNumber.pod') if $ENV{RENDER};

ok 1 and done_testing;
