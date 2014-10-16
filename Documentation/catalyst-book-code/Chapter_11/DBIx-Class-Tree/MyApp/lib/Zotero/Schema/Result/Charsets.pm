package Zotero::Schema::Result::Charsets;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("charsets");
__PACKAGE__->add_columns(
  "charsetid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "charset",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("charsetid");
__PACKAGE__->add_unique_constraint("charset_unique", ["charset"]);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:36r5nCxIfvGDi/S2j+x2EQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
