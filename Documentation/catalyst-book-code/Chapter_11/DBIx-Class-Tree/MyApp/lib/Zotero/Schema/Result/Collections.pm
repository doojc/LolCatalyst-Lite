package Zotero::Schema::Result::Collections;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Tree::AdjacencyList", "Core");
__PACKAGE__->table("collections");
__PACKAGE__->add_columns(
  "collectionid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "collectionname",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "parentcollectionid",
  {
    data_type => "INT",
    default_value => "NULL",
    is_nullable => 1,
    size => undef,
  },
  "dateadded",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
  "datemodified",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
  "clientdatemodified",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
  "libraryid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "key",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("collectionid");
__PACKAGE__->add_unique_constraint("libraryid_key_unique", ["libraryid", "key"]);
__PACKAGE__->belongs_to(
  "parentcollectionid",
  "Zotero::Schema::Result::Collections",
  { collectionid => "parentcollectionid" },
);
__PACKAGE__->has_many(
  "collections",
  "Zotero::Schema::Result::Collections",
  { "foreign.parentcollectionid" => "self.collectionid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:44:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:me4RU+ciXJAMxqRHsazrJg

 __PACKAGE__->parent_column("parentcollectionID");
1;
