package main;

use 5.018;

use strict;
use warnings;

use Test::More;
use Venus::Test;

my $test = test(__FILE__);
my $seed = 42;

=name

Faker::Plugin::JaJp::CompanyName

=cut

$test->for('name');

=tagline

Company Name

=cut

$test->for('tagline');

=abstract

Company Name for Faker

=cut

$test->for('abstract');

=includes

method: new
method: execute

=cut

$test->for('includes');

=synopsis

  package main;

  use Faker::Plugin::JaJp::CompanyName;

  my $plugin = Faker::Plugin::JaJp::CompanyName->new;

  # bless(..., "Faker::Plugin::JaJp::CompanyName")

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::JaJp::CompanyName');

  $result
});

=description

This package provides methods for generating fake data for company name.

+=encoding utf8

=cut

$test->for('description');

=inherits

Faker::Plugin::JaJp

=cut

$test->for('inherits');

=method execute

The execute method returns a returns a random fake company name.

=signature execute

  execute(HashRef $data) (Str)

=metadata execute

{
  since => '1.10',
}

=example-1 execute

  package main;

  use Faker::Plugin::JaJp::CompanyName;

  my $plugin = Faker::Plugin::JaJp::CompanyName->new;

  # bless(..., "Faker::Plugin::JaJp::CompanyName")

  # my $result = $plugin->execute;

  # '株式会社 伊藤';

  # my $result = $plugin->execute;

  # '株式会社 村山';

  # my $result = $plugin->execute;

  # '有限会社 松本';

=cut

$test->for('example', 1, 'execute', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::JaJp::CompanyName');
  ok $result->faker;
  ok $result->faker->random->reseed($seed);
  ok $result->faker->random->pick; # reset randomizer
  is $result->execute, '株式会社 伊藤';
  ok $result->faker->random->pick; # reset randomizer
  is $result->execute, '株式会社 村山';
  ok $result->faker->random->pick; # reset randomizer
  is $result->execute, '有限会社 松本';

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

  use Faker::Plugin::JaJp::CompanyName;

  my $plugin = Faker::Plugin::JaJp::CompanyName->new;

  # bless(..., "Faker::Plugin::JaJp::CompanyName")

=cut

$test->for('example', 1, 'new', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::JaJp::CompanyName');
  ok $result->faker;

  $result
});

=partials

t/Faker.t: pdml: authors
t/Faker.t: pdml: license

=cut

$test->for('partials');

# END

$test->render('lib/Faker/Plugin/JaJp/CompanyName.pod') if $ENV{RENDER};

ok 1 and done_testing;
