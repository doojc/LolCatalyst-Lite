package Zotero::Schema::Result::Itemtags;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("itemTags");
__PACKAGE__->add_columns(
  "itemid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "tagid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("itemid", "tagid");
__PACKAGE__->belongs_to(
  "itemid",
  "Zotero::Schema::Result::Items",
  { itemid => "itemid" },
);
__PACKAGE__->belongs_to("tagid", "Zotero::Schema::Result::Tags", { tagid => "tagid" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:X/Xb2AwyExwCDglJ/bM0RQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
