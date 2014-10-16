package Zotero::Schema::Result::Fulltextitemwords;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("fulltextItemWords");
__PACKAGE__->add_columns(
  "wordid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "itemid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("wordid", "itemid");
__PACKAGE__->belongs_to(
  "wordid",
  "Zotero::Schema::Result::Fulltextwords",
  { wordid => "wordid" },
);
__PACKAGE__->belongs_to(
  "itemid",
  "Zotero::Schema::Result::Items",
  { itemid => "itemid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:o2PU1noTl0Nm6HUrKChSfg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
