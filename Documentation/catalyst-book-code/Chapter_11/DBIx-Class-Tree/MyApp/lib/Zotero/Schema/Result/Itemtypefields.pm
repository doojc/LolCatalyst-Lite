package Zotero::Schema::Result::Itemtypefields;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("itemTypeFields");
__PACKAGE__->add_columns(
  "itemtypeid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "fieldid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "hide",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "orderindex",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("itemtypeid", "fieldid");
__PACKAGE__->belongs_to(
  "itemtypeid",
  "Zotero::Schema::Result::Itemtypes",
  { itemtypeid => "itemtypeid" },
);
__PACKAGE__->belongs_to(
  "fieldid",
  "Zotero::Schema::Result::Fields",
  { fieldid => "fieldid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TCVKMvEVXJnSgld2oYTqYg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
