package Zotero::Schema::Result::Itemtypes;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("itemTypes");
__PACKAGE__->add_columns(
  "itemtypeid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "typename",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "templateitemtypeid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "display",
  { data_type => "INT", default_value => 1, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("itemtypeid");
__PACKAGE__->has_many(
  "itemtypefields",
  "Zotero::Schema::Result::Itemtypefields",
  { "foreign.itemtypeid" => "self.itemtypeid" },
);
__PACKAGE__->has_many(
  "itemtypecreatortypes",
  "Zotero::Schema::Result::Itemtypecreatortypes",
  { "foreign.itemtypeid" => "self.itemtypeid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:B/cOjlPjOgnTL5Qtbv5KhQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
