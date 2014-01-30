requires "Class::Load" => "0";
requires "DateTime" => "0";
requires "DateTime::TimeZone" => "0";
requires "Exception::Tiny" => "0";
requires "Function::Parameters" => "0";
requires "Hash::Merge::Simple" => "0";
requires "Module::Find" => "0";
requires "Moo" => "0";
requires "Type::Tiny" => "0";
requires "perl" => "v5.14.0";

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.30";
};

on 'develop' => sub {
  requires "Test::CPAN::Changes" => "0.19";
};
