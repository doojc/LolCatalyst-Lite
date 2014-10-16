package SneakyCat::Schema::Result::Roles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("roles");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "role",
  { data_type => "char", is_nullable => 0, size => 32 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "users_to_roles",
  "SneakyCat::Schema::Result::UsersToRoles",
  { "foreign.role" => "self.id" },
);



# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-03-05 14:49:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4aut88zAB+VzEiUoVkp+QA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
