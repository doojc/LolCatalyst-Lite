   package MailerExample::UI::Model::Mail;
   use strict;
   use warnings;
   use parent qw( Catalyst::Model::Adaptor );
   use aliased 'MailerExample::InterfaceModel::Mailer';

   __PACKAGE__->config(class => Mailer, args => {});

   1;
