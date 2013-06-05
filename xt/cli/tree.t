use strict;
use Test::More;
use xt::CLI;

{
    my $app = cli();

    $app->dir->child("cpanfile")->spew(<<EOF);
requires 'HTML::Parser';
EOF

    $app->run("install");
    $app->run("tree");

    is $app->exit_code, 0;
    like $app->stdout, qr/^HTML::Parser \(HTML-Parser-/m;
    like $app->stdout, qr/^ HTML::Tagset \(HTML-Tagset-/m;
}

done_testing;



