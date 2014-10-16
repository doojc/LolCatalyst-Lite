package Zotero::Schema::Result::Transactionlog;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("transactionLog");
__PACKAGE__->add_columns(
  "transactionid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "field",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "value",
  {
    data_type => "NONE",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("transactionid", "field", "value");
__PACKAGE__->belongs_to(
  "transactionid",
  "Zotero::Schema::Result::Transactions",
  { transactionid => "transactionid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LihZtmLvK8GNEnxSkgpE/w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
