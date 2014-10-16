package Zotero::Schema::Result::Itemtypecreatortypes;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("itemTypeCreatorTypes");
__PACKAGE__->add_columns(
  "itemtypeid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "creatortypeid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "primaryfield",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("itemtypeid", "creatortypeid");
__PACKAGE__->belongs_to(
  "itemtypeid",
  "Zotero::Schema::Result::Itemtypes",
  { itemtypeid => "itemtypeid" },
);
__PACKAGE__->belongs_to(
  "creatortypeid",
  "Zotero::Schema::Result::Creatortypes",
  { creatortypeid => "creatortypeid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3A4b9o3hvFzDe6njSldi6Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
