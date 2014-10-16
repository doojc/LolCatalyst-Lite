package Zotero::Schema::Result::Proxyhosts;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("proxyHosts");
__PACKAGE__->add_columns(
  "hostid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "proxyid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "hostname",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("hostid");
__PACKAGE__->belongs_to(
  "proxyid",
  "Zotero::Schema::Result::Proxies",
  { proxyid => "proxyid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3kl9kLJdNHNiLQZjcOTMcA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
