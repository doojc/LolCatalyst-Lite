package Zotero::Schema::Result::Savedsearchconditions;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("savedSearchConditions");
__PACKAGE__->add_columns(
  "savedsearchid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "searchconditionid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "condition",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "operator",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "value",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "required",
  {
    data_type => "NONE",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("savedsearchid", "searchconditionid");
__PACKAGE__->belongs_to(
  "savedsearchid",
  "Zotero::Schema::Result::Savedsearches",
  { savedsearchid => "savedsearchid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ocV3DDZs2WBtOZm9B2j/Ww


# You can replace this text with custom content, and it will be preserved on regeneration
1;
