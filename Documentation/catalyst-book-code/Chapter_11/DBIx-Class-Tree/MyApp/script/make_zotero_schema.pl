 #!/usr/bin/perl
 use warnings;
 use strict;
 use FindBin qw/$Bin/;
 use DBIx::Class::Schema::Loader qw/ make_schema_at /;

 my %options;
 if (@ARGV) {
     my $table = shift @ARGV;
     %options = ( constraint => $table,
                  components => [@ARGV]);
 }

 make_schema_at("Zotero::Schema",
                {
                    %options,
                    debug => 1,
                    relationships => 1,
                    use_namespaces => 1,
                    dump_directory => "$Bin/../lib" ,
                },
                ["dbi:SQLite:dbname=$Bin/../zotero.sqlite",
                 "",""]);


=head1 make_zotero_schema.pl [table name] [components]

     Make the DBIC schema from the zotero db, optionally limit it to a
     particular table, and adding specific components to the table.

=cut
