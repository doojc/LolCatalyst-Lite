 package Greeter;
 use Moose; # provides warnings and strict


 has guests =>  ( is => 'rw', isa => 'ArrayRef[Str]', default => sub { [] } );
 has members => ( is => 'rw', isa => 'ArrayRef[Greeter::Member]', required => 1);
 has guest_greeting =>  ( is => 'ro', isa => 'Str',
     default => 'Hello __NAME__, I hope you are having a nice visit');
 has unknown_greeting =>  ( is => 'ro', isa => 'Str',
     default => "Hello __NAME__, I don't know you, do I?");

 # by convention use declarations normally at the top for the file
 use List::Util qw/first/;

 sub greet {
     my ($self, $greeting_name, $greetee_name) = @_;
     my $greeting;
     # the condition below is a security hole!
     if (! $greetee_name || $greeting_name eq $greetee_name ) {
         $greeting = $self->_greet_person($greeting_name);
     }
     else {
         $greeting = $self->_greet_other_person($greeting_name, $greetee_name);
     }
     return $greeting;
 }

sub _greet_person {
    my ($self, $name) = @_;
    my $greeting;
    $DB::single=1;
    # find member.
    my ($member, $guest);
    if ($member = first { $_->name eq $name } @{$self->members}) {
        $greeting = $member->greeting;
    }
    # find guest
    elsif ($guest = first { $_ eq $name} @{$self->guests} ) {
        $greeting = $self->_greet_guest($name)
    }
    # else unknown
    else  {
        $greeting = $self->_greet_unknown($name)
    }
    return $greeting;
}

sub _greet_unknown {
    my ($self, $name) = @_;
    my $greeting = $self->unknown_greeting;
    $greeting =~ s/__NAME__/$name/;
    return $greeting;
}

sub _greet_guest {
    my ($self, $name) = @_;
    my $greeting = $self->guest_greeting;
    $greeting =~ s/__NAME__/$name/;
    return $greeting;
}

sub _greet_other_person {
    my ($self, $greeter, $greetee) = @_;
    my $greeting; # return value

    # This is a bit of a shortcut we'd refactor if performance was important
    # but it improves the presentation of code right now
    my $greeter_member = first { $_->name eq $greeter } @{$self->members};
    my $greeter_guest = first { $_ eq $greeter } @{$self->guests};
    my $greetee_member = first { $_->name eq $greetee } @{$self->members};
    my $greetee_guest = first { $_ eq $greetee } @{$self->guests};

    # greeter and greetee are both members
    if ($greeter_member && $greetee_member) {
        $greeting = $greeter_member->greet_guest($greetee_member->name);
    }
    # greeter and greetee are respectively member and guest
    elsif ($greeter_member && $greetee_guest) {
        $greeting = $greeter_member->greet_guest($greetee_guest);
    }
    # greeter and greetee are both guests 
    elsif ($greeter_guest && $greetee_guest) {
        $greeting = $self->_greet_guest($greetee);
    }
    # greetee is a member and greeter is a guest or unknown
    elsif ($greetee_member) {
        $greeting = $greetee_member->greeting;
    }
     elsif ( !($greeter_member || $greeter_guest) && $greetee_guest ) {
         $greeting = $self->_greet_guest($greetee_guest);
     }
    # fallback
    else {
        $greeting = $self->_greet_unknown($greetee);
    }
    return $greeting;
}

 1;
__END__
 =head1 NAME

 Greeter

 =head1 SYNOPSIS

 Programmer's library to store and retrieve member and guest greetings for a
 group of named individuals.

 =head1 USAGE

  my $member = Greeter::Member->new(name => 'Sleepy',
                                   greeting_string => 'Night Night __NAME__'
                                   );
  my $greeter = Greeter->new(
                 guests => [$member],
                 guests => [qw( Homer Bart Marge Maggie) ]
                 guest_greeting =>
                 'Hello __NAME__, I hope you are having a nice visit');
