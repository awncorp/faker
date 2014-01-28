package Faker::Provider::Lorem;

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
        # ...
    }

    $self->$orig($format);
};

method paragraph ($n_sentences=4) {
    return $self->sentences($n_sentences) . "\n\n";
}

method paragraphs ($n_paragraphs=2, $v_length=5) {
    return join "", map {
        $v_length > 4 ?
            $self->paragraph($self->random_between(4, $v_length)) :
            $self->paragraph
    }   1..$n_paragraphs;
}

method sentence ($n_words=5) {
    return $self->words($n_words) . '.';
}

method sentences ($n_sentences=3, $v_length=10) {
    return join ' ', map {
        $v_length > 3 ?
            $self->sentence($self->random_between(3, $v_length)) :
            $self->sentence
    }   1..$n_sentences;
}

method word {
    my $data = $self->data;
    return $self->random_item(@{$data->{word_data}});
}

method words ($count=5) {
    my $data = $self->data;
    return join ' ', map {
        $self->random_item(@{$data->{word_data}})
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
