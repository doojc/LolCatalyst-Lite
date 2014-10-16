package Zotero::Schema::Result::Syncdeletelog;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("syncDeleteLog");
__PACKAGE__->add_columns(
  "syncobjecttypeid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
  "libraryid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "key",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "timestamp",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
);
__PACKAGE__->add_unique_constraint("libraryid_key_unique", ["libraryid", "key"]);
__PACKAGE__->belongs_to(
  "syncobjecttypeid",
  "Zotero::Schema::Result::Syncobjecttypes",
  { syncobjecttypeid => "syncobjecttypeid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ObB74fD+js7x+eP5oM2dKQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
