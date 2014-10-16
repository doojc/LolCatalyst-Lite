 package MyCalais::Controller::REST;

 use strict;
 use warnings;
 use base 'Catalyst::Controller::REST';

 sub index : Path Args(0) ActionClass('REST') {
     my ($self, $c) = @_;
 }

 sub index_PUT {
     my ($self, $c) = @_;
     my $url = $c->req->data->{url};
     my $model = $c->model('Calais');
     my $data;
     eval { $data = $model->url_as_data($url) };
     if (! $@ ) {
         $model->storage->{$url} = $data;
         $self->status_created($c,
                          location => $c->req->uri->as_string,
                          entity => { $url => $data } );
     }
     else { # this is $data->{error} does exist
          $c->res->status(502);
          $c->stash( rest => { error => 'Error with the upstream web service, pl
ease try again shortly' } );
     }
 }

 *index_POST = *index_PUT;

 sub record :Path Args(1) ActionClass('REST') {
     my ($self, $c) = @_;
 }

  sub record_GET {
     my ($self, $c, $uri) = @_;
     my $model = $c->model('Calais');
     if (exists $model->storage->{$uri}) {
         $self->status_ok( $c,
                           entity => { $uri => $model->storage->{$uri} },
                       );
     }
     else {
         $self->status_not_found($c, {message => "$uri is not in the database"});
     }
 }

   sub record_DELETE {
      my ($self, $c, $uri) = @_;
      my $model = $c->model('Calais');
      if (defined $model->storage->{$uri}) {
          my %rec = %{$model->storage->{$uri}}; # copy resource before deletion
          delete $model->storage->{$uri};
          $self->status_ok( $c,
                            entity => {
                                $uri =>  \%rec },
                        );
      }
      else {
          $self->status_not_found($c, message => "$uri is not in the database, can not be deleted" );
      }
 }



 1;
