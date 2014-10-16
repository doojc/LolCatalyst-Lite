package Zotero::Schema::Result::Basefieldmappings;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("baseFieldMappings");
__PACKAGE__->add_columns(
  "itemtypeid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "basefieldid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "fieldid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("itemtypeid", "basefieldid", "fieldid");
__PACKAGE__->belongs_to(
  "basefieldid",
  "Zotero::Schema::Result::Fields",
  { fieldid => "basefieldid" },
);
__PACKAGE__->belongs_to(
  "fieldid",
  "Zotero::Schema::Result::Fields",
  { fieldid => "fieldid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:D2a5wWWL5l0DGUf/fgc3RQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
