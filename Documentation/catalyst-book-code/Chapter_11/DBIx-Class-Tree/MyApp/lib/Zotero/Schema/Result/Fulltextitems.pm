package Zotero::Schema::Result::Fulltextitems;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("fulltextItems");
__PACKAGE__->add_columns(
  "itemid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "version",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "indexedpages",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "totalpages",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "indexedchars",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "totalchars",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("itemid");
__PACKAGE__->belongs_to(
  "itemid",
  "Zotero::Schema::Result::Items",
  { itemid => "itemid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hg7bbarUg34vqalOzebvUQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
