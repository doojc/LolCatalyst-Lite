package Zotero::Schema::Result::Items;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("items");
__PACKAGE__->add_columns(
  "itemid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "itemtypeid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
  "dateadded",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
  "datemodified",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
  "clientdatemodified",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
  "libraryid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "key",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("itemid");
__PACKAGE__->add_unique_constraint("libraryid_key_unique", ["libraryid", "key"]);
__PACKAGE__->has_many(
  "itemdatas",
  "Zotero::Schema::Result::Itemdata",
  { "foreign.itemid" => "self.itemid" },
);
__PACKAGE__->has_many(
  "itemnotes_itemids",
  "Zotero::Schema::Result::Itemnotes",
  { "foreign.itemid" => "self.itemid" },
);
__PACKAGE__->has_many(
  "itemnotes_sourceitemids",
  "Zotero::Schema::Result::Itemnotes",
  { "foreign.sourceitemid" => "self.itemid" },
);
__PACKAGE__->has_many(
  "itemattachments_itemids",
  "Zotero::Schema::Result::Itemattachments",
  { "foreign.itemid" => "self.itemid" },
);
__PACKAGE__->has_many(
  "itemattachments_sourceitemids",
  "Zotero::Schema::Result::Itemattachments",
  { "foreign.sourceitemid" => "self.sourceitemid" },
);
__PACKAGE__->has_many(
  "itemtags",
  "Zotero::Schema::Result::Itemtags",
  { "foreign.itemid" => "self.itemid" },
);
__PACKAGE__->has_many(
  "itemseealso_itemids",
  "Zotero::Schema::Result::Itemseealso",
  { "foreign.itemid" => "self.itemid" },
);
__PACKAGE__->has_many(
  "itemseealso_linkeditemids",
  "Zotero::Schema::Result::Itemseealso",
  { "foreign.linkeditemid" => "self.itemid" },
);
__PACKAGE__->has_many(
  "itemcreators",
  "Zotero::Schema::Result::Itemcreators",
  { "foreign.itemid" => "self.itemid" },
);
__PACKAGE__->has_many(
  "collectionitems",
  "Zotero::Schema::Result::Collectionitems",
  { "foreign.itemid" => "self.itemid" },
);
__PACKAGE__->has_many(
  "fulltextitemwords",
  "Zotero::Schema::Result::Fulltextitemwords",
  { "foreign.itemid" => "self.itemid" },
);
__PACKAGE__->has_many(
  "fulltextitems",
  "Zotero::Schema::Result::Fulltextitems",
  { "foreign.itemid" => "self.itemid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:03SCLJLH0L6/eif+R/Pxvg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
