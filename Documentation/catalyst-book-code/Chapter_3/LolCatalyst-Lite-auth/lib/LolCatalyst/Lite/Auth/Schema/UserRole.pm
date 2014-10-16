package LolCatalyst::Lite::Auth::Schema::UserRole;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("EncodedColumn", "Core");
__PACKAGE__->table("user_role");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "user",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "roleid",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "user",
  "LolCatalyst::Lite::Auth::Schema::User",
  { id => "user" },
);
__PACKAGE__->belongs_to(
  "roleid",
  "LolCatalyst::Lite::Auth::Schema::Role",
  { id => "roleid" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-09-25 15:39:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZgwGPGcNzJANTm8A2WpOhA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
