$doc = 0;
$isText = 0;

foreach $file(@ARGV) {
    open(IN, $file) || die " Cannnot open $file: $!";
    while($line = <IN>){
        chomp($line);
        if ($line =~ m/<NUM>/){
            $doc++;
        }
        if ($line =~ m/<\/TEXT>/){
            $isText = 0;
        }
        if ($isText){
            @words = split(/ /,$line);
            for my $word(@words){
                print "D00$doc $word\n";
            }
        }
        if ($line =~ m/<TEXT>/){
            $isText = 1;
        }
        
    }
}

