   package MailerExample::InterfaceModel::Mailer::Send;
   use Reaction::Class;

   use MooseX::Types::Moose   qw( Str );
   use Reaction::Types::Core  qw( NonEmptySimpleStr );
   use Reaction::Types::Email qw( EmailAddress );

   use namespace::clean -except => 'meta';
   extends 'Reaction::InterfaceModel::Action';

   has sender => (
       is          => 'rw',
       isa         => EmailAddress,
       required    => 1,
       lazy_fail   => 1,
   );

   has subject => (
       is          => 'rw',
       isa         => NonEmptySimpleStr,
       required    => 1,
       lazy_fail   => 1,
   );

   has message => (
       is          => 'rw',
       isa         => Str,
       required    => 1,
       lazy_fail   => 1,
   );

   sub do_apply {
       my ($self) = @_;

       my $mailer = $self->target_model;
       $mailer->send(map { ($_ => $self->$_) } qw( sender subject message ));

       return 1;
   }

   1;
