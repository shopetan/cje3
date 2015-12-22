%id = ();
$id{'kuma'} = 'x1';
$id{'neko'} = 'x2';
$id{'kiji'} = 'x3';
$id{'saru'} = 'x4';

while($line=<STDIN>){
    chomp($line);
    print "$id{line}\n";
}
