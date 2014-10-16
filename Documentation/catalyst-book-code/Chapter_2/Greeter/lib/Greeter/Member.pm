 package Greeter::Member;
 use Moose;

 has 'name'            => ( is => 'ro', isa => 'Str', required => 1);
 has 'greeting_string' => ( is => 'ro', isa => 'Str', required => 1);
 has 'greeting'        => ( is => 'ro', isa => 'Str', lazy_build => 1);

 sub _build_greeting {
     my ($self)   = @_;
     my $greeting = $self->greeting_string;
     my $name = $self->name;
     $greeting    =~ s/__NAME__/$name/;
     return $greeting;
 }

  sub greet_guest {
     my ($self, $name) = @_;
     die "A name argument is required to greet a guest" if ! $name;
     my $greeting = $self->greeting_string;
     $greeting    =~ s/__NAME__/$name/;
     return $greeting;
 }
 1;
