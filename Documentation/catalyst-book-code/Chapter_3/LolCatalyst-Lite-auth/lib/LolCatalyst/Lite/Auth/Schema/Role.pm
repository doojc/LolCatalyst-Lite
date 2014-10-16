package LolCatalyst::Lite::Auth::Schema::Role;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("EncodedColumn", "Core");
__PACKAGE__->table("role");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "role",
  { data_type => "TEXT", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("role_unique", ["role"]);
__PACKAGE__->has_many(
  "user_roles",
  "LolCatalyst::Lite::Auth::Schema::UserRole",
  { "foreign.roleid" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-09-25 15:39:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZbVvKaC+flrmr9EvAO2ZsQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
