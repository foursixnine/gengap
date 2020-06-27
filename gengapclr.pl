package Gengapclr;
use Mojo::Log;
use Mojolicious::Lite;

app->config(morbo => {listen => ['http://*:8080']});

my $log = Mojo::Log->new(level => 'debug');

# Keys and tokens
app->config(gengapclr =>{
		'name' => 'Generational Gap Clarificator',
		'url' => 'https://millenialornot.com',
		'version' => 'pre alpha v0.0.1'
});


$log->info('Starting!');
$log->debug('name: ' . app->config->{gengapclr}->{name});
$log->debug('Url: ' . app->config->{gengapclr}->{url});
$log->debug('Version: ' . app->config->{gengapclr}->{version});


get '/' => sub {
    my ($c) = @_;
    
    $c->render(text => "Hello");
};

any '/<year:num>' => sub {
    my ($c) = @_;
    my $year = $c->param('year');
    $c->render(text => "$year");
};


sub request_authorization {
    ...
};

sub process_redirection {
    ...
};

sub request_acess_token {
    ...
};

app->start;
