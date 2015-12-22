while($line = <STDIN>){
    chomp($line);
    @a = split(//, $line);
    $x = $a[0] + $a[1] + $a[2];
    print "$x\n";

}
