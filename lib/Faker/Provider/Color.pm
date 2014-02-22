package Faker::Provider::Color;

use Bubblegum::Class;
use Bubblegum::Syntax -types;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

around guesser => sub {
    my ($orig, $self, $format) =
        (shift, type_obj(shift), type_str(shift));

    return 'safe_color_name' if $format =~ /^(color)$/;

    $self->$orig($format);
};

sub color_name {
    my $self = type_obj shift;
    my $data = type_href $self->data;
    $self->random_item($data->{all_color_data});
}

sub hex_color {
    my $self   = type_obj shift;
    my $number = $self->random_between(1, 16777215);
    return '#' . sprintf('%06s', sprintf('%02x', $number));
}

sub rgbcolors {
    my $self = type_obj shift;
    return join ',', @{$self->rgbcolors_array};
}

sub rgbcolors_array {
    my $self  = type_obj shift;
    my $color = $self->hex_color;
    return [
        hex(substr($color, 1, 2)),
        hex(substr($color, 3, 2)),
        hex(substr($color, 5, 2)),
    ]
}

sub rgbcolors_css {
    my $self = type_obj shift;
    return sprintf 'rgb(%s)', $self->rgbcolors;
}

sub safe_color_name {
    my $self = type_obj shift;
    my $data = type_href $self->data;
    $self->random_item($data->{safe_color_data});
}

sub safe_hex_color {
    my $self   = type_obj shift;
    my $number = $self->random_between(0, 255);
    return '#' . sprintf("ff00%02x", $number);
}

1;

__DATA__

@@ all_color_data
AliceBlue
AntiqueWhite
Aqua
Aquamarine
Azure
Beige
Bisque
Black
BlanchedAlmond
Blue
BlueViolet
Brown
BurlyWood
CadetBlue
Chartreuse
Chocolate
Coral
CornflowerBlue
Cornsilk
Crimson
Cyan
DarkBlue
DarkCyan
DarkGoldenRod
DarkGray
DarkGreen
DarkKhaki
DarkMagenta
DarkOliveGreen
Darkorange
DarkOrchid
DarkRed
DarkSalmon
DarkSeaGreen
DarkSlateBlue
DarkSlateGray
DarkTurquoise
DarkViolet
DeepPink
DeepSkyBlue
DimGray
DimGrey
DodgerBlue
FireBrick
FloralWhite
ForestGreen
Fuchsia
Gainsboro
GhostWhite
Gold
GoldenRod
Gray
Green
GreenYellow
HoneyDew
HotPink
IndianRed
Indigo
Ivory
Khaki
Lavender
LavenderBlush
LawnGreen
LemonChiffon
LightBlue
LightCoral
LightCyan
LightGoldenRodYellow
LightGray
LightGreen
LightPink
LightSalmon
LightSeaGreen
LightSkyBlue
LightSlateGray
LightSteelBlue
LightYellow
Lime
LimeGreen
Linen
Magenta
Maroon
MediumAquaMarine
MediumBlue
MediumOrchid
MediumPurple
MediumSeaGreen
MediumSlateBlue
MediumSpringGreen
MediumTurquoise
MediumVioletRed
MidnightBlue
MintCream
MistyRose
Moccasin
NavajoWhite
Navy
OldLace
Olive
OliveDrab
Orange
OrangeRed
Orchid
PaleGoldenRod
PaleGreen
PaleTurquoise
PaleVioletRed
PapayaWhip
PeachPuff
Peru
Pink
Plum
PowderBlue
Purple
Red
RosyBrown
RoyalBlue
SaddleBrown
Salmon
SandyBrown
SeaGreen
SeaShell
Sienna
Silver
SkyBlue
SlateBlue
SlateGray
Snow
SpringGreen
SteelBlue
Tan
Teal
Thistle
Tomato
Turquoise
Violet
Wheat
White
WhiteSmoke
Yellow
YellowGreen

@@ safe_color_data
black
maroon
green
navy
olive
purple
teal
lime
blue
silver
gray
yellow
fuchsia
aqua
white
