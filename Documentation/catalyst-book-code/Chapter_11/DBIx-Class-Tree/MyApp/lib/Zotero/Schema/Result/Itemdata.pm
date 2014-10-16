package Zotero::Schema::Result::Itemdata;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("itemData");
__PACKAGE__->add_columns(
  "itemid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "fieldid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "valueid",
  { data_type => "", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("itemid", "fieldid");
__PACKAGE__->belongs_to(
  "itemid",
  "Zotero::Schema::Result::Items",
  { itemid => "itemid" },
);
__PACKAGE__->belongs_to(
  "fieldid",
  "Zotero::Schema::Result::Fields",
  { fieldid => "fieldid" },
);
__PACKAGE__->belongs_to(
  "valueid",
  "Zotero::Schema::Result::Itemdatavalues",
  { valueid => "valueid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rkYQ37qIRUrKRuGu4zO1Fg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
