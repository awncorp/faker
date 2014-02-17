package Faker::Provider::Lorem;

use Bubblegum::Class;
use Bubblegum::Syntax -types;

with 'Faker::Role::Data';
with 'Faker::Role::Provider';

sub paragraph {
    my $self        = type_obj shift;
    my $n_sentences = type_int shift // 4;
    return $self->sentences($n_sentences) . "\n\n";
}

sub paragraphs {
    my $self         = type_obj shift;
    my $n_paragraphs = type_int shift // 2;
    my $v_length     = type_int shift // 5;

    return join "", map {
        $v_length > 4 ?
            $self->paragraph($self->random_between(4, $v_length)) :
            $self->paragraph
    }   1..$n_paragraphs;
}

sub sentence {
    my $self    = type_obj shift;
    my $n_words = type_int shift // 5;
    return $self->words($n_words) . '.';
}

sub sentences {
    my $self        = type_obj shift;
    my $n_sentences = type_int shift // 3;
    my $v_length    = type_int shift // 10;

    return join ' ', map {
        $v_length > 3 ?
            $self->sentence($self->random_between(3, $v_length)) :
            $self->sentence
    }   1..$n_sentences;
}

sub word {
    my $self = type_obj shift;
    my $data = type_href $self->data;
    return $self->random_item($data->{word_data});
}

sub words {
    my $self  = type_obj shift;
    my $count = type_int shift // 5;
    my $data  = type_href $self->data;

    return join ' ', map {
        $self->random_item($data->{word_data})
    }   1..$count;
}

1;

__DATA__

@@ word_data
alias
consequatur
aut
perferendis
sit
voluptatem
accusantium
doloremque
aperiam
eaque
ipsa
quae
ab
illo
inventore
veritatis
et
quasi
architecto
beatae
vitae
dicta
sunt
explicabo
aspernatur
aut
odit
aut
fugit
sed
quia
consequuntur
magni
dolores
eos
qui
ratione
voluptatem
sequi
nesciunt
neque
dolorem
ipsum
quia
dolor
sit
amet
consectetur
adipisci
velit
sed
quia
non
numquam
eius
modi
tempora
incidunt
ut
labore
et
dolore
magnam
aliquam
quaerat
voluptatem
ut
enim
ad
minima
veniam
quis
nostrum
exercitationem
ullam
corporis
nemo
enim
ipsam
voluptatem
quia
voluptas
sit
suscipit
laboriosam
nisi
ut
aliquid
ex
ea
commodi
consequatur
quis
autem
vel
eum
iure
reprehenderit
qui
in
ea
voluptate
velit
esse
quam
nihil
molestiae
et
iusto
odio
dignissimos
ducimus
qui
blanditiis
praesentium
laudantium
totam
rem
voluptatum
deleniti
atque
corrupti
quos
dolores
et
quas
molestias
excepturi
sint
occaecati
cupiditate
non
provident
sed
ut
perspiciatis
unde
omnis
iste
natus
error
similique
sunt
in
culpa
qui
officia
deserunt
mollitia
animi
id
est
laborum
et
dolorum
fuga
et
harum
quidem
rerum
facilis
est
et
expedita
distinctio
nam
libero
tempore
cum
soluta
nobis
est
eligendi
optio
cumque
nihil
impedit
quo
porro
quisquam
est
qui
minus
id
quod
maxime
placeat
facere
possimus
omnis
voluptas
assumenda
est
omnis
dolor
repellendus
temporibus
autem
quibusdam
et
aut
consequatur
vel
illum
qui
dolorem
eum
fugiat
quo
voluptas
nulla
pariatur
at
vero
eos
et
accusamus
officiis
debitis
aut
rerum
necessitatibus
saepe
eveniet
ut
et
voluptates
repudiandae
sint
et
molestiae
non
recusandae
itaque
earum
rerum
hic
tenetur
a
sapiente
delectus
ut
aut
reiciendis
voluptatibus
maiores
doloribus
asperiores
repellat
