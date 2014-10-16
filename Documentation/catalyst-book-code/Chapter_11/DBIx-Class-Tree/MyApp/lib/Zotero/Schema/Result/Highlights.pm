package Zotero::Schema::Result::Highlights;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("highlights");
__PACKAGE__->add_columns(
  "highlightid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "itemid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "startparent",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "starttextnode",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "startoffset",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "endparent",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "endtextnode",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "endoffset",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "datemodified",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("highlightid");
__PACKAGE__->belongs_to(
  "itemid",
  "Zotero::Schema::Result::Itemattachments",
  { itemid => "itemid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fcE0L6+UAnB37/jjDJc72A


# You can replace this text with custom content, and it will be preserved on regeneration
1;
