package main;

use 5.018;

use strict;
use warnings;

use Test::More;
use Venus::Test;

my $test = test(__FILE__);
my $seed = 42;

=name

Faker::Plugin::EsEs::PersonNamePrefix

=cut

$test->for('name');

=tagline

Person Name Prefix

=cut

$test->for('tagline');

=abstract

Person Name Prefix for Faker

=cut

$test->for('abstract');

=includes

method: new
method: execute

=cut

$test->for('includes');

=synopsis

  package main;

  use Faker::Plugin::EsEs::PersonNamePrefix;

  my $plugin = Faker::Plugin::EsEs::PersonNamePrefix->new;

  # bless(..., "Faker::Plugin::EsEs::PersonNamePrefix")

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::EsEs::PersonNamePrefix');

  $result
});

=description

This package provides methods for generating fake data for person name prefix.

+=encoding utf8

=cut

$test->for('description');

=inherits

Faker::Plugin::EsEs

=cut

$test->for('inherits');

=method execute

The execute method returns a returns a random fake person name prefix.

=signature execute

  execute(HashRef $data) (Str)

=metadata execute

{
  since => '1.10',
}

=example-1 execute

  package main;

  use Faker::Plugin::EsEs::PersonNamePrefix;

  my $plugin = Faker::Plugin::EsEs::PersonNamePrefix->new;

  # bless(..., "Faker::Plugin::EsEs::PersonNamePrefix")

  # my $result = $plugin->execute;

  # 'Señor';

  # my $result = $plugin->execute;

  # 'Señora';

  # my $result = $plugin->execute;

  # 'Señora';

=cut

$test->for('example', 1, 'execute', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::EsEs::PersonNamePrefix');
  ok $result->faker;
  ok $result->faker->random->reseed($seed);
  ok $result->faker->random->pick; # reset randomizer
  is $result->execute, 'Señor';
  ok $result->faker->random->pick; # reset randomizer
  is $result->execute, 'Señora';
  ok $result->faker->random->pick; # reset randomizer
  is $result->execute, 'Señora';

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

  use Faker::Plugin::EsEs::PersonNamePrefix;

  my $plugin = Faker::Plugin::EsEs::PersonNamePrefix->new;

  # bless(..., "Faker::Plugin::EsEs::PersonNamePrefix")

=cut

$test->for('example', 1, 'new', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::EsEs::PersonNamePrefix');
  ok $result->faker;

  $result
});

=partials

t/Faker.t: pdml: authors
t/Faker.t: pdml: license

=cut

$test->for('partials');

# END

$test->render('lib/Faker/Plugin/EsEs/PersonNamePrefix.pod') if $ENV{RENDER};

ok 1 and done_testing;
