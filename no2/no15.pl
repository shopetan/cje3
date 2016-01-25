$file1 = './sample1_en.txt';
open(IN, $file1) || die " Cannnot open $file: $!";

@list =();
$wc = 0;
$cc = 0;
$lc = 0;

while($line = <IN>){
    chomp($line);
    @words = split(/ /,$line);

    for my $word(@words){
        $wc++;
    }
    
    @chars = split(//,$line);
    for my $char(@chars){
        $cc++;
    }
    $lc++;
    $cc++;
}

print "line count\n";
print "$lc\n";
print "word count\n";
print "$wc\n";
print "char count\n";
print "$cc\n";

close(IN) || die "Cannnot clone $file: $!";

