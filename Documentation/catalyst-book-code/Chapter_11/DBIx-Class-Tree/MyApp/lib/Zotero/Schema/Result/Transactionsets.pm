package Zotero::Schema::Result::Transactionsets;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("transactionSets");
__PACKAGE__->add_columns(
  "transactionsetid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "event",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("transactionsetid");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HsGfrE5NcBg4dr9NoJ9r9A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
