package Zotero::Schema::Result::Deleteditems;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("deletedItems");
__PACKAGE__->add_columns(
  "itemid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "datedeleted",
  {
    data_type => "",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("itemid");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DIGAudqjx5taFATx7jpazg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
