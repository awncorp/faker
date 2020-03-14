requires "Data::Object::Class" => "2.02";
requires "Data::Object::ClassHas" => "2.01";
requires "Data::Object::Plugin" => "0.01";
requires "Data::Object::Role::Pluggable" => "0.01";
requires "Data::Object::Role::Proxyable" => "2.03";
requires "Data::Object::Role::Throwable" => "2.00";
requires "perl" => "5.014";
requires "routines" => "0";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "Data::Object::Class" => "2.02";
  requires "Data::Object::ClassHas" => "2.01";
  requires "Data::Object::Plugin" => "0.01";
  requires "Data::Object::Role::Pluggable" => "0.01";
  requires "Data::Object::Role::Proxyable" => "2.03";
  requires "Data::Object::Role::Throwable" => "2.00";
  requires "Test::Auto" => "0.07";
  requires "perl" => "5.014";
  requires "routines" => "0";
  requires "strict" => "0";
  requires "warnings" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};
