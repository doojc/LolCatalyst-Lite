package Zotero::Schema::Result::Savedsearches;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("savedSearches");
__PACKAGE__->add_columns(
  "savedsearchid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "savedsearchname",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "dateadded",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
  "datemodified",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
  "clientdatemodified",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
  "libraryid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "key",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("savedsearchid");
__PACKAGE__->add_unique_constraint("libraryid_key_unique", ["libraryid", "key"]);
__PACKAGE__->has_many(
  "savedsearchconditions",
  "Zotero::Schema::Result::Savedsearchconditions",
  { "foreign.savedsearchid" => "self.savedsearchid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4j1ye4HdS7Sa5pKl1W/LgA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
