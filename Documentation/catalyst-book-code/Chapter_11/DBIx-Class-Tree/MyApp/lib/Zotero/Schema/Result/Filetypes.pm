package Zotero::Schema::Result::Filetypes;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("fileTypes");
__PACKAGE__->add_columns(
  "filetypeid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "filetype",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("filetypeid");
__PACKAGE__->add_unique_constraint("fileType_unique", ["filetype"]);
__PACKAGE__->has_many(
  "filetypemimetypes",
  "Zotero::Schema::Result::Filetypemimetypes",
  { "foreign.filetypeid" => "self.filetypeid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PNVfx9FURleOaHtldB+HMw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
