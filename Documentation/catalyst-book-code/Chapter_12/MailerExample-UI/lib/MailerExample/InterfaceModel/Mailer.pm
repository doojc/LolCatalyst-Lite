   package MailerExample::InterfaceModel::Mailer;
   use Reaction::InterfaceModel::ObjectClass;

   use Email::Stuff;
   use Email::Send;
   use aliased 'MailerExample::InterfaceModel::Mailer::Send';

   use namespace::clean -except => 'meta';

   sub send {
       my ($self, %args) = @_;

       my $sender = Email::Send->new(
           {   mailer      => 'Gmail',
               mailer_args => [
                   username => 'you@gmail.com',
                   password => 'your_password',
               ]
           }
       );

       Email::Stuff->new
             ->using($sender)
                 ->from($args{sender})
                     ->to('kieren@diment.org')
                         ->subject($args{subject})
                             ->text_body($args{message})
                                 ->send or die "Failed to send: $!";
   }

   sub send_action {
       my ($self) = @_;
       return Send->new(target_model => $self);
   }

   1;
