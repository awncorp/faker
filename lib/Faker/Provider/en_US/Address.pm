package Faker::Provider::en_US::Address;

use 5.14.0;
use feature 'unicode_strings';
use Moo;
use Function::Parameters;

extends 'Faker::Provider::Address';

method city_prefix {
    my $data = $self->data;
    return $self->random_item(@{$data->{city_prefix_data}});
}

method secondary_address {
    my $data   = $self->data;
    my $format = $self->random_item(@{$data->{secondary_address_data_formats}});
    return $self->generator->parse($format);
}

method state_abbr {
    my $data = $self->data;
    return $self->random_item(@{$data->{state_abbr_data}});
}

method state_name {
    my $data = $self->data;
    return $self->random_item(@{$data->{state_name_data}});
}

1;

__DATA__

@@ address_data_formats
{{street_address}}\n{{city}}, {{state_abbr}} {{postal_code}}

@@ city_data_formats
{{city_prefix}} {{first_name}}{{city_suffix}}
{{city_prefix}} {{first_name}}
{{first_name}}{{city_suffix}}
{{last_name}}{{city_suffix}}

@@ city_prefix_data
North
East
West
South
New
Lake
Port

@@ city_suffix_data
town
ton
land
ville
berg
burgh
borough
bury
view
port
mouth
stad
furt
chester
mouth
fort
haven
side
shire

@@ country_name_data
Afghanistan
Albania
Algeria
American Samoa
Andorra
Angola
Anguilla
Antarctica
Antigua and Barbuda
Argentina
Armenia
Aruba
Australia
Austria
Azerbaijan
Bahamas
Bahrain
Bangladesh
Barbados
Belarus
Belgium
Belize
Benin
Bermuda
Bhutan
Bolivia
Bosnia and Herzegovina
Botswana
Bouvet Island
Brazil
British Indian Ocean Territory
British Virgin Islands
Brunei Darussalam
Bulgaria
Burkina Faso
Burundi
Cambodia
Cameroon
Canada
Cape Verde
Cayman Islands
Central African Republic
Chad
Chile
China
Christmas Island
Cocos Islands
Colombia
Comoros
Congo
Cook Islands
Costa Rica
Cote d'Ivoire
Croatia
Cuba
Cyprus
Czech Republic
Denmark
Djibouti
Dominica
Dominican Republic
Ecuador
Egypt
El Salvador
Equatorial Guinea
Eritrea
Estonia
Ethiopia
Faroe Islands
Falkland Islands
Fiji
Finland
France
French Guiana
French Polynesia
French Southern Territories
Gabon
Gambia
Georgia
Germany
Ghana
Gibraltar
Greece
Greenland
Grenada
Guadeloupe
Guam
Guatemala
Guernsey
Guinea
Guinea-Bissau
Guyana
Haiti
Heard Island and McDonald Islands
Holy See
Honduras
Hong Kong
Hungary
Iceland
India
Indonesia
Iran
Iraq
Ireland
Isle of Man
Israel
Italy
Jamaica
Japan
Jersey
Jordan
Kazakhstan
Kenya
Kiribati
Korea
Korea
Kuwait
Kyrgyz Republic
Lao People's Democratic Republic
Latvia
Lebanon
Lesotho
Liberia
Libyan Arab Jamahiriya
Liechtenstein
Lithuania
Luxembourg
Macao
Macedonia
Madagascar
Malawi
Malaysia
Maldives
Mali
Malta
Marshall Islands
Martinique
Mauritania
Mauritius
Mayotte
Mexico
Micronesia
Moldova
Monaco
Mongolia
Montenegro
Montserrat
Morocco
Mozambique
Myanmar
Namibia
Nauru
Nepal
Netherlands Antilles
Netherlands
New Caledonia
New Zealand
Nicaragua
Niger
Nigeria
Niue
Norfolk Island
Northern Mariana Islands
Norway
Oman
Pakistan
Palau
Palestinian Territory
Panama
Papua New Guinea
Paraguay
Peru
Philippines
Pitcairn Islands
Poland
Portugal
Puerto Rico
Qatar
Reunion
Romania
Russian Federation
Rwanda
Saint Barthelemy
Saint Helena
Saint Kitts and Nevis
Saint Lucia
Saint Martin
Saint Pierre and Miquelon
Saint Vincent and the Grenadines
Samoa
San Marino
Sao Tome and Principe
Saudi Arabia
Senegal
Serbia
Seychelles
Sierra Leone
Singapore
Slovakia (Slovak Republic)
Slovenia
Solomon Islands
Somalia
South Africa
South Georgia and the South Sandwich Islands
Spain
Sri Lanka
Sudan
Suriname
Svalbard & Jan Mayen Islands
Swaziland
Sweden
Switzerland
Syrian Arab Republic
Taiwan
Tajikistan
Tanzania
Thailand
Timor-Leste
Togo
Tokelau
Tonga
Trinidad and Tobago
Tunisia
Turkey
Turkmenistan
Turks and Caicos Islands
Tuvalu
Uganda
Ukraine
United Arab Emirates
United Kingdom
United States of America
United States Minor Outlying Islands
United States Virgin Islands
Uruguay
Uzbekistan
Vanuatu
Venezuela
Vietnam
Wallis and Futuna
Western Sahara
Yemen
Zambia
Zimbabwe

@@ secondary_address_data_formats
Apt. ###
Suite ###

@@ state_name_data
Alabama
Alaska
Arizona
Arkansas
California
Colorado
Connecticut
Delaware
Florida
Georgia
Hawaii
Idaho
Illinois
Indiana
Iowa
Kansas
Kentucky
Louisiana
Maine
Maryland
Massachusetts
Michigan
Minnesota
Mississippi
Missouri
Montana
Nebraska
Nevada
NewHampshire
NewJersey
NewMexico
NewYork
NorthCarolina
NorthDakota
Ohio
Oklahoma
Oregon
Pennsylvania
RhodeIsland
SouthCarolina
SouthDakota
Tennessee
Texas
Utah
Vermont
Virginia
Washington
WestVirginia
Wisconsin
Wyoming

@@ state_abbr_data
AA
AE
AK
AL
AP
AR
AS
AZ
CA
CO
CT
DC
DE
FL
FM
GA
GU
HI
IA
ID
IL
IN
KS
KY
LA
MA
MD
ME
MH
MI
MN
MO
MP
MS
MT
NC
ND
NE
NH
NJ
NM
NV
NY
OH
OK
OR
PA
PR
PW
RI
SC
SD
TN
TX
UT
VA
VI
VT
WA
WI
WV
WY

@@ street_name_data_formats
{{first_name}} {{street_suffix}}
{{last_name}} {{street_suffix}}

@@ street_address_data_formats
{{building_number}} {{street_name}}
{{building_number}} {{street_name}} {{secondary_address}}
