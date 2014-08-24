requires "Bubblegum" => "0.31";
requires "Class::Load" => "0.21";
requires "Hash::Merge::Simple" => "0.051";
requires "Throwable" => "0.200011";
requires "perl" => "v5.10.0";

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.30";
};
