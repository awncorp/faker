package Faker::Signature;

use parent 'Function::Parameters';

use Type::Registry;

# VERSION

@Function::Parameters::type_reifiers = (
    *_reify_type_default = sub {
        require Faker::Type;
        my $registry = Type::Registry->for_me;
           $registry->add_types(-Standard);
           $registry->add_types('Faker::Type');
           $registry->lookup($_[0]);
    }
);

1;
