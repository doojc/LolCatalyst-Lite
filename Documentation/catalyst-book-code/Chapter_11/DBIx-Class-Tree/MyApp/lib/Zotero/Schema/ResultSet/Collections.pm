package Zotero::Schema::ResultSet::Collections;
 use warnings;
 use strict;

use base qw/DBIx::Class::ResultSet/;

 sub get_collections_tree {
     my $self = shift;
     my @res;
     my $rs = $self->search( {parentcollectionid => undef},
                             {order_by => [ 'collectionname' ] },
                         );
     while (my $node =  $rs->next) {
         push @res, $self->get_children($node);
     }
     return \@res;
 }

 sub get_children {
     my ($self, $node ) = @_;
     my $res = {};
     $res->{title} = $node->collectionname ;
     $res->{key} = $node->collectionid;
     my @kids = $node->children;
     $res->{expand} = 1;
     if (@kids) {
         my @children;
         foreach (@kids) {
              push @children, [$self->get_children($_)];
         }
         $res->{children} = \@children;
     }
     return $res;
 }

 1;
