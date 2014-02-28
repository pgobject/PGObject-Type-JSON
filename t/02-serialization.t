use Test::More tests => 23;
use PGObject::Type::JSON;

use Carp::Always;

use strict;
use warnings;

my $nulltest = 'null';
my $undeftest = undef;
my $hashtest = '{"foo": 1, "bar": 2}';
my $arraytest = '[1,2,3]';
my $literaltest = '123';
my ($undef, $null, $hash, $array, $literal);

# string 'null', should serialize as 'null', not the same as db null
ok($null = PGObject::Type::JSON->from_db($nulltest), 'Instantiate null');
ok($null->isa('PGObject::Type::JSON'), "Null is a JSON object");
is($null->reftype, 'SCALAR', 'Null is a scalar');
is($null->to_db, 'null', 'Serializes to db as null');
ok(!$null->is_null, 'Null is not undef');

# undef, db null, should serialize as undef
ok($undef = PGObject::Type::JSON->from_db($undeftest), 'Instantiate undef');
ok($undef->isa('PGObject::Type::JSON'), 'Undef isa JSON object');
is($undef->reftype, 'SCALAR', 'Undef is scalar');
is($undef->to_db, undef, 'Serializes to db as undef');
ok($undef->is_null, 'undef is undef');

#hashref, should serialize exactly as it is
ok($hash = PGObject::Type::JSON->from_db($hashtest), 'Instantiate hashref');
ok($hash->isa('PGObject::Type::JSON'), "Hashref is a JSON object");
is($hash->reftype, 'HASH', 'Hashref is a HASH');
is($hash->to_db, '{"bar":2,"foo":1}', 'Serialization of hashtest works');
is($hash->{foo}, 1, 'Hash foo element is 1');
is($hash->{bar}, 2, 'Hash bar element is 2');

#arrayref should serialize as it is
ok($array = PGObject::Type::JSON->from_db($arraytest), 'Instantiate arrayref');
is($array->reftype, 'ARRAY', 'Array is ARRAY');
is_deeply($array, [1, 2, 3], 'Array is correct array');
is($array->to_db, $arraytest, 'Array serializes to db correctly');

#literal ref, should be a scalar ref, serializing as it is
ok($literal = PGObject::Type::JSON->from_db($literaltest), 
     'Instantiate literal');
is($literal->reftype, 'SCALAR', 'Literal is SCALAR');
is($literal->to_db, '"123"', 'Literal serializes correctly');
