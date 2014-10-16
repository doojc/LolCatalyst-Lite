package Zotero::Schema::Result::Annotations;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("annotations");
__PACKAGE__->add_columns(
  "annotationid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "itemid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "parent",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "textnode",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "offset",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "x",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "y",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "cols",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "rows",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "text",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "collapsed",
  {
    data_type => "BOOL",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "datemodified",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("annotationid");
__PACKAGE__->belongs_to(
  "itemid",
  "Zotero::Schema::Result::Itemattachments",
  { itemid => "itemid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kxJaxruktmQAKkatpWn09g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
