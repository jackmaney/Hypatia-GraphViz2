use strict;
use warnings;
use Test::More;
use Hypatia;
use Hypatia::DBI::Test::SQLite;
use Scalar::Util qw(blessed);

BEGIN
{
    eval "require DBD::SQLite";
    if($@)
    {
	require Test::More;
	Test::More::plan(skip_all=>"DBD::SQLite is required to run these tests.")
    }
}

my $hdts=Hypatia::DBI::Test::SQLite->new({table=>"hypatia_graphviz_test_petersen"});
my $dbh=$hdts->dbh;

 my $hypatia=Hypatia->new({
    back_end=>"GraphViz2",
    dbi=>{dbh=>$hdts->dbh,
	table=>"hypatia_graphviz_test_petersen"},
});
 
ok(blessed($hypatia) eq "Hypatia");
ok(blessed($hypatia->dbh) eq 'DBI::db');
ok($hypatia->dbh->{Active});

my $gv2=$hypatia->graph;

ok(blessed($gv2) eq "GraphViz2");

 

done_testing();