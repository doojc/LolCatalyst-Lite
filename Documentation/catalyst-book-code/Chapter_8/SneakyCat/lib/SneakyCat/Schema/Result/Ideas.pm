package SneakyCat::Schema::Result::Ideas;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("ideas");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "text",
  { data_type => "text", is_nullable => 0, size => undef },
  "secret",
  { data_type => "char", is_nullable => 0, size => 3 },
  "added",
  { data_type => 'text', is_nullable => 0, size => 20 },
  "added_by",
  { data_type => 'text', is_nullable => 0, size => 32 }
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-03-05 14:49:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:N+zQ/zFkvo4yaYw2EK62gw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
