package PGObject::Type::JSON;

use 5.006;
use strict;
use warnings;
use PGObject;
use JSON;

=head1 NAME

PGObject::Type::JSON - JSON wrappers for PGObject

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

   PGOBject::Type::JSON->register();

Columns of type json will be converted into hashrefs

   my $obj =  PGOBject::Type::JSON->new($hashref);

$obj will now serialize to the database as json.

=head1 DESCRIPTION

This module allows json types or others (specified by custom register) types to
be converted from JSON into objects according to their values.

This module assumes that encoding will be in UTF8 across the board and is not
safe to use with other database encodings.

=head1 SUBROUTINES/METHODS

=head2 register()

=cut

=head2 new($ref)

Stores this for JSON.

=cut

sub new {
    my ($class, $ref);
    $ref = \$ref unless ref $ref;
    bless $ref, $class;
} 

=head2 from_db



=head2 to_db

=head2 is_null

=head1 AUTHOR

Chris Travers, C<< <chris.travers at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-pgobject-type-json at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=PGObject-Type-JSON>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc PGObject::Type::JSON


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=PGObject-Type-JSON>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/PGObject-Type-JSON>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/PGObject-Type-JSON>

=item * Search CPAN

L<http://search.cpan.org/dist/PGObject-Type-JSON/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Chris Travers.

This program is released under the following license: BSD


=cut

1; # End of PGObject::Type::JSON
