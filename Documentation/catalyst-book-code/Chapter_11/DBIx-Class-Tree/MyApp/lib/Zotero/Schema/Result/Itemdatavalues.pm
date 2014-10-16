package Zotero::Schema::Result::Itemdatavalues;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("itemDataValues");
__PACKAGE__->add_columns(
  "valueid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "value",
  { data_type => "", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("valueid");
__PACKAGE__->has_many(
  "itemdatas",
  "Zotero::Schema::Result::Itemdata",
  { "foreign.valueid" => "self.valueid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9OL/Vyz11J8zlaVeEwRAvA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
