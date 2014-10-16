package Zotero::Schema::Result::Transactions;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("transactions");
__PACKAGE__->add_columns(
  "transactionid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "transactionsetid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "context",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "action",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("transactionid");
__PACKAGE__->has_many(
  "transactionlogs",
  "Zotero::Schema::Result::Transactionlog",
  { "foreign.transactionid" => "self.transactionid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6ZM4bGgWjGMbEUpL0pkIDA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
