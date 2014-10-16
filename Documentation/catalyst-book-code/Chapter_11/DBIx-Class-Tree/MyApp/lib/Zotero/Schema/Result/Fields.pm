package Zotero::Schema::Result::Fields;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("fields");
__PACKAGE__->add_columns(
  "fieldid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "fieldname",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "fieldformatid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("fieldid");
__PACKAGE__->has_many(
  "itemdatas",
  "Zotero::Schema::Result::Itemdata",
  { "foreign.fieldid" => "self.fieldid" },
);
__PACKAGE__->belongs_to(
  "fieldformatid",
  "Zotero::Schema::Result::Fieldformats",
  { fieldformatid => "fieldformatid" },
);
__PACKAGE__->has_many(
  "itemtypefields",
  "Zotero::Schema::Result::Itemtypefields",
  { "foreign.fieldid" => "self.fieldid" },
);
__PACKAGE__->has_many(
  "basefieldmappings_basefieldids",
  "Zotero::Schema::Result::Basefieldmappings",
  { "foreign.basefieldid" => "self.fieldid" },
);
__PACKAGE__->has_many(
  "basefieldmappings_fieldids",
  "Zotero::Schema::Result::Basefieldmappings",
  { "foreign.fieldid" => "self.fieldid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:V8xk2x3mSYtbf4I7S8wLtQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
