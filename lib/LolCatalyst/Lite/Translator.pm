package LolCatalyst::Lite::Translator;

use Moose;
use Acme::LOLCAT ();
use namespace::clean -except => 'meta';

has 'default_target' => ( is => 'ro', isa => 'Str', required => 1, default => 'LOLCAT');
has 'translators' => ( is => 'ro', isa => 'HashRef', lazy_build => 1);

sub _build_translators
{
	my ($self) = @_;
	return { LOLCAT => LolCatalyst::Lite::Translator::LOLCAT->new}
}

sub translate
{
	my ($self, $text) = @_;
	return Acme::LOLCAT::translate($text);
}

__PACKAGE__->meta->make_immutable;

1;