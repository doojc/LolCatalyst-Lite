package SneakyCat::Schema::Result::UsersToRoles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("users_to_roles");
__PACKAGE__->add_columns(
  "user",
  { data_type => "int", is_nullable => 0, size => 11 },
  "role",
  { data_type => "int", is_nullable => 0, size => 11 },
);

__PACKAGE__->set_primary_key("user", "role");

__PACKAGE__->belongs_to( role => 'SneakyCat::Schema::Result::Roles', { 'foreign.id' => 'self.role'});

__PACKAGE__->belongs_to( user => 'SneakyCat::Schema::Result::Users', { 'foreign.id' => 'self.user'});

# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-03-05 14:49:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rF4B28ddLeNEzgVkl8IMSQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
