package Zotero::Schema::Result::Itemattachments;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("itemAttachments");
__PACKAGE__->add_columns(
  "itemid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "sourceitemid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "linkmode",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "mimetype",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "charsetid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "path",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "originalpath",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "syncstate",
  { data_type => "INT", default_value => 0, is_nullable => 1, size => undef },
  "storagemodtime",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("itemid");
__PACKAGE__->belongs_to(
  "itemid",
  "Zotero::Schema::Result::Items",
  { itemid => "itemid" },
);
__PACKAGE__->belongs_to(
  "sourceitemid",
  "Zotero::Schema::Result::Items",
  { sourceitemid => "sourceitemid" },
);
__PACKAGE__->has_many(
  "annotations",
  "Zotero::Schema::Result::Annotations",
  { "foreign.itemid" => "self.itemid" },
);
__PACKAGE__->has_many(
  "highlights",
  "Zotero::Schema::Result::Highlights",
  { "foreign.itemid" => "self.itemid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2mR5Xho/HkAAIpB6rUAMJg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
