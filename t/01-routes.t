use Test::More;
use Mojo::File qw(curfile);
use Test::Mojo;

# Portably point to "../myapp.pl"
my $script = curfile->dirname->sibling('gengapclr.pl');
#
my $t = Test::Mojo->new($script);
$t->get_ok('/')->status_is(200)->content_like(qr/Hello/);
$t->get_ok('/a2002')->status_is(404);
$t->get_ok('/>')->status_is(404);
$t->get_ok('/$')->status_is(404);
$t->get_ok('/\\$\\\'')->status_is(404);
$t->get_ok('/1986')->status_is(200)->content_is('1986', 'Correct year');
done_testing();
