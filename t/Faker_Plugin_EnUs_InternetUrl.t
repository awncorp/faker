package main;

use 5.018;

use strict;
use warnings;

use Test::More;
use Venus::Test;

my $test = test(__FILE__);
my $seed = 42;

=name

Faker::Plugin::EnUs::InternetUrl

=cut

$test->for('name');

=tagline

Internet Url

=cut

$test->for('tagline');

=abstract

Internet Url for Faker

=cut

$test->for('abstract');

=includes

method: new
method: execute

=cut

$test->for('includes');

=synopsis

  package main;

  use Faker::Plugin::EnUs::InternetUrl;

  my $plugin = Faker::Plugin::EnUs::InternetUrl->new;

  # bless(..., "Faker::Plugin::EnUs::InternetUrl")

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::EnUs::InternetUrl');

  $result
});

=description

This package provides methods for generating fake data for internet url.

+=encoding utf8

=cut

$test->for('description');

=inherits

Faker::Plugin::EnUs

=cut

$test->for('inherits');

=method execute

The execute method returns a returns a random fake internet url.

=signature execute

  execute(HashRef $data) (Str)

=metadata execute

{
  since => '1.10',
}

=example-1 execute

  package main;

  use Faker::Plugin::EnUs::InternetUrl;

  my $plugin = Faker::Plugin::EnUs::InternetUrl->new;

  # bless(..., "Faker::Plugin::EnUs::InternetUrl")

  # my $result = $plugin->execute;

  # "https://krajcik-skiles-and-mayer.com/";

  # my $result = $plugin->execute;

  # "http://heidenreich-beier.co/";

  # my $result = $plugin->execute;

  # "https://goldner-mann-and-emard.org/";

=cut

$test->for('example', 1, 'execute', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::EnUs::InternetUrl');
  ok $result->faker;
  ok $result->faker->random->reseed($seed);
  ok $result->faker->random->make; # reset randomizer
  is $result->execute, "https://krajcik-skiles-and-mayer.com/";
  ok $result->faker->random->make; # reset randomizer
  is $result->execute, "http://heidenreich-beier.co/";
  ok $result->faker->random->make; # reset randomizer
  is $result->execute, "https://goldner-mann-and-emard.org/";

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

  use Faker::Plugin::EnUs::InternetUrl;

  my $plugin = Faker::Plugin::EnUs::InternetUrl->new;

  # bless(..., "Faker::Plugin::EnUs::InternetUrl")

=cut

$test->for('example', 1, 'new', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::EnUs::InternetUrl');
  ok $result->faker;

  $result
});

# END

$test->render('lib/Faker/Plugin/EnUs/InternetUrl.pod') if $ENV{RENDER};

ok 1 and done_testing;
