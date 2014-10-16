package Zotero::Schema::Result::Creatortypes;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("creatorTypes");
__PACKAGE__->add_columns(
  "creatortypeid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "creatortype",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("creatortypeid");
__PACKAGE__->has_many(
  "itemtypecreatortypes",
  "Zotero::Schema::Result::Itemtypecreatortypes",
  { "foreign.creatortypeid" => "self.creatortypeid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bNxTAFBVxnW3AB4y1DDIKw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
