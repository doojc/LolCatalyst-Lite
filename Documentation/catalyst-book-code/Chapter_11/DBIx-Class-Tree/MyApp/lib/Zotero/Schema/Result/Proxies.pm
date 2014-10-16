package Zotero::Schema::Result::Proxies;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("proxies");
__PACKAGE__->add_columns(
  "proxyid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "multihost",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "autoassociate",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "scheme",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("proxyid");
__PACKAGE__->has_many(
  "proxyhosts",
  "Zotero::Schema::Result::Proxyhosts",
  { "foreign.proxyid" => "self.proxyid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tHKQ2BOEWBMaLBdfwHPSZA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
