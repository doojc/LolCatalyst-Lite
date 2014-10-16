package MailerExample::UI::Controller::Root;

   use parent 'Reaction::UI::Controller::Root';
   use Reaction::Class;

   use aliased 'Reaction::UI::ViewPort::SiteLayout';
   use aliased 'Reaction::UI::ViewPort::Action';
   use aliased 'Reaction::UI::ViewPort';

   use namespace::clean -except => 'meta';

   __PACKAGE__->config(
       namespace => '',
       view_name => 'Site',
   );

   has site_title => (
       is          => 'rw',
       isa         => 'Str',
       required    => 1,
       default     => 'Reaction MailerExample',
   );

   sub base: Chained PathPart('') CaptureArgs(0) {
       my ($self, $ctx) = @_;

       $self->push_viewport(SiteLayout,
           static_base_uri => $ctx->uri_for('/static')->as_string,
           title           => $self->site_title,
       );
   }

   sub form: Chained('base') PathPart('') Args(0) {
       my ($self, $ctx) = @_;

       $self->push_viewport(Action,
           model => $ctx->model('Mail')->send_action,
           field_order => [qw( sender subject message )],
           apply_label => 'Send',
           on_apply_callback => sub { 
               $ctx->res->redirect($ctx->uri_for($self->action_for('sent')));
           },
       );
   }

   sub sent: Chained('base') PathPart('sent') Args(0) {
       my ($self, $ctx) = @_;

       $self->push_viewport(ViewPort, layout => 'sent');
   }

   1;

