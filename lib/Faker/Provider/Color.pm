package Faker::Provider::Color;

use 5.14.0;
use feature 'switch';
use feature 'unicode_strings';
use Moo;
use Function::Parameters;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

around guesser => sub {
    my ($orig, $self, $format) = @_;

    given ($format) {
        when (/^(color)$/) {
            return 'safe_color_name';
        }
    }

    $self->$orig($format);
};

method color_name {
    my $data = $self->data;
    $self->random_item(@{$data->{all_color_data}});
}

method hex_color {
    my $number = $self->random_between(1, 16777215);
    return '#' . sprintf('%06s', sprintf('%02x', $number));
}

method rgbcolors {
    return join ',', @{$self->rgbcolors_array};
}

method rgbcolors_array {
    my $color = $self->hex_color;
    return [
        hex(substr($color, 1, 2)),
        hex(substr($color, 3, 2)),
        hex(substr($color, 5, 2)),
    ]
}

method rgbcolors_css {
    return sprintf 'rgb(%s)', $self->rgbcolors;
}

method safe_color_name {
    my $data = $self->data;
    $self->random_item(@{$data->{safe_color_data}});
}

method safe_hex_color {
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
