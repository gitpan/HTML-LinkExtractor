# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 10 };
use HTML::LinkExtractor;
ok(1); # If we made it this far, we're ok.

my $output = `$^X $INC{'HTML/LinkExtractor.pm'}`;

#use Data::Dumper;die Dumper $output;

ok( $output =~ m{8 we GOT}  or 0 );
ok( $output =~ m{\Q'cite' => 'http://www.stonehenge.com/merlyn/'} or 0 );
ok( $output =~ m{\Q'url' => 'http://www.foo.com/foo.html'} or 0 );

my $LX = new HTML::LinkExtractor(undef,undef,1);

ok( $LX->strip or 0 );
ok( $LX->strip(1) && $LX->strip or 0 );

$LX->parse(\ q{ <a href="http://slashdot.org">stuff that matters</a> } );

ok( $LX->links->[0]->{_TEXT} eq "stuff that matters" or 0);

$LX = new HTML::LinkExtractor(
    sub {
        my( $lx, $link ) = @_;
        $output = $link->{_TEXT};
    },
    'http://use.perl.org', 1
);

ok(1);

$LX->parse(\ q{
<a href="http://use.perl.org/search.pl?op=stories&author=4">perl guy</a>
} );

ok( $output eq 'perl guy' or 0 );
ok( @{ $LX->links } == 0 ? 1 : 0 );

#########################

# Insert your test code below, the Test module is use()ed here so read
# its man page ( perldoc Test ) for help writing this test script.

