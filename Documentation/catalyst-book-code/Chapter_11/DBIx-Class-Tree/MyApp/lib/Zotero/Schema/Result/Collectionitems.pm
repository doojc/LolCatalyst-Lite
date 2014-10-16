package Zotero::Schema::Result::Collectionitems;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("collectionItems");
__PACKAGE__->add_columns(
  "collectionid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "itemid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "orderindex",
  { data_type => "INT", default_value => 0, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("collectionid", "itemid");
__PACKAGE__->belongs_to(
  "collectionid",
  "Zotero::Schema::Result::Collections",
  { collectionid => "collectionid" },
);
__PACKAGE__->belongs_to(
  "itemid",
  "Zotero::Schema::Result::Items",
  { itemid => "itemid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gUF9Mp+7mv/bMO55NdwpFA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
