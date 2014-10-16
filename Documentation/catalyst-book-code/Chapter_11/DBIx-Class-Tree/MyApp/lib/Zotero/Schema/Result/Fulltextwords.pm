package Zotero::Schema::Result::Fulltextwords;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("fulltextWords");
__PACKAGE__->add_columns(
  "wordid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "word",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("wordid");
__PACKAGE__->add_unique_constraint("word_unique", ["word"]);
__PACKAGE__->has_many(
  "fulltextitemwords",
  "Zotero::Schema::Result::Fulltextitemwords",
  { "foreign.wordid" => "self.wordid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6slSrwGqxy9l1KaFT+usBA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
