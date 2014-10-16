package Zotero::Schema::Result::Itemcreators;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("itemCreators");
__PACKAGE__->add_columns(
  "itemid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "creatorid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "creatortypeid",
  { data_type => "INT", default_value => 1, is_nullable => 1, size => undef },
  "orderindex",
  { data_type => "INT", default_value => 0, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("itemid", "creatorid", "creatortypeid", "orderindex");
__PACKAGE__->belongs_to(
  "itemid",
  "Zotero::Schema::Result::Items",
  { itemid => "itemid" },
);
__PACKAGE__->belongs_to(
  "creatorid",
  "Zotero::Schema::Result::Creators",
  { creatorid => "creatorid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6KEZEItsymewzcMA7xAwRA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
