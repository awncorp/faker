package main;

use 5.018;

use strict;
use warnings;

use Test::More;
use Venus::Test;

my $test = test(__FILE__);
my $seed = 42;

=name

Faker::Plugin::HttpUserAgent

=cut

$test->for('name');

=tagline

HTTP User-Agent

=cut

$test->for('tagline');

=abstract

HTTP User-Agent for Faker

=cut

$test->for('abstract');

=includes

method: new
method: execute

=cut

$test->for('includes');

=synopsis

  package main;

  use Faker::Plugin::HttpUserAgent;

  my $plugin = Faker::Plugin::HttpUserAgent->new;

  # bless(..., "Faker::Plugin::HttpUserAgent")

=cut

$test->for('synopsis', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::HttpUserAgent');

  $result
});

=description

This package provides methods for generating fake data for HTTP user-agents.

+=encoding utf8

=cut

$test->for('description');

=inherits

Faker::Plugin

=cut

$test->for('inherits');

=method execute

The execute method returns a returns a random fake HTTP user-agent.

=signature execute

  execute(HashRef $data) (Str)

=metadata execute

{
  since => '1.17',
}

=example-1 execute

  package main;

  use Faker::Plugin::HttpUserAgent;

  my $plugin = Faker::Plugin::HttpUserAgent->new;

  # bless(..., "Faker::Plugin::HttpUserAgent")

  # my $result = $plugin->execute;

  # "Mozilla/6.1 (Macintosh; U; Max OS X 50.7; rv:6.8.4) ... Safari/5.4.4";

  # my $result = $plugin->execute;

  # "Mozilla/9.0 (X11; U; Linux x86_64; rv:0.3) Gecko/20210406 X11 Chrome/5.8";

  # my $result = $plugin->execute;

  # "Mozilla/9.8 (Macintosh; U; Max OS X 52.3; rv:0.9.1) ... Chrome/2.50";

=cut

$test->for('example', 1, 'execute', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::HttpUserAgent');
  ok $result->faker;
  ok $result->faker->random->reseed($seed);
  ok $result->faker->random->pick; # reset randomizer
  is $result->execute, 'Mozilla/6.1 (Macintosh; U; Max OS X 50.7; rv:6.8.4) Gecko/20110406 Macintosh Safari/5.4.4';
  ok $result->faker->random->pick; # reset randomizer
  is $result->execute, 'Mozilla/9.0 (X11; U; Linux x86_64; rv:0.3) Gecko/20210406 X11 Chrome/5.8';
  ok $result->faker->random->pick; # reset randomizer
  is $result->execute, 'Mozilla/9.8 (Macintosh; U; Max OS X 52.3; rv:0.9.1) Gecko/20070406 Macintosh Chrome/2.50';

  $result
});

=method new

The new method returns a new instance of the class.

=signature new

  new(HashRef $data) (Plugin)

=metadata new

{
  since => '1.17',
}

=example-1 new

  package main;

  use Faker::Plugin::HttpUserAgent;

  my $plugin = Faker::Plugin::HttpUserAgent->new;

  # bless(..., "Faker::Plugin::HttpUserAgent")

=cut

$test->for('example', 1, 'new', sub {
  my ($tryable) = @_;
  ok my $result = $tryable->result;
  ok $result->isa('Faker::Plugin::HttpUserAgent');
  ok $result->faker;

  $result
});

=partials

t/Faker.t: pdml: authors
t/Faker.t: pdml: license

=cut

$test->for('partials');

# END

$test->render('lib/Faker/Plugin/HttpUserAgent.pod') if $ENV{RENDER};

ok 1 and done_testing;
