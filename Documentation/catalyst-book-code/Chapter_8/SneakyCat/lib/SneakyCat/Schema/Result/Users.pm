package SneakyCat::Schema::Result::Users;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("users");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "username",
  { data_type => "char", is_nullable => 0, size => 32 },
  "password",
  { data_type => "char", is_nullable => 0, size => 64 },
  "status",
  { data_type => "char", is_nullable => 0, size => 16 },
  "last_whisper",
  { data_type => "char", is_nullable => 0, size => 20 },
);
__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many('user_to_roles', 'SneakyCat::Schema::Result::UsersToRoles', { 'foreign.user' => 'self.id'});

__PACKAGE__->many_to_many( roles => 'user_to_roles', 'role');

# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-03-05 14:49:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Z1JD3HXexGh5gvs4ffjtsQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
