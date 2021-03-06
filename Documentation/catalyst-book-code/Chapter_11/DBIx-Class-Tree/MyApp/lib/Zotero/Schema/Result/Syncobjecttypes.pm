package Zotero::Schema::Result::Syncobjecttypes;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("syncObjectTypes");
__PACKAGE__->add_columns(
  "syncobjecttypeid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "name",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("syncobjecttypeid");
__PACKAGE__->has_many(
  "syncdeletelogs",
  "Zotero::Schema::Result::Syncdeletelog",
  { "foreign.syncobjecttypeid" => "self.syncobjecttypeid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:P7+lq5xdi2XmioBUiRYuiw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
