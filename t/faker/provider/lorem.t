use Test::More;

use_ok 'Faker';
use_ok 'Faker::Provider::Lorem';

my $faker    = Faker->new;
my $provider = Faker::Provider::Lorem->new(factory => $faker);

ok $provider->does($_) for qw(
    Faker::Role::Data
    Faker::Role::Format
    Faker::Role::Process
    Faker::Role::Random
);

ok $provider->paragraph, 'paragraph method ok' for 1..50;
ok $provider->paragraphs, 'paragraphs method ok' for 1..50;
ok $provider->sentence, 'sentence method ok' for 1..50;
ok $provider->sentences, 'sentences method ok' for 1..50;
ok $provider->word, 'word method ok' for 1..50;
ok $provider->words, 'words method ok' for 1..50;

ok 1 and done_testing;
