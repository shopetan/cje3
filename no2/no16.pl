print "line count | word count | char count\n";
@list_wc = ();
@list_cc = ();
@list_lc = ();

$total_wc = 0;
$total_cc = 0;
$total_lc = 0;

foreach $file(@ARGV) {
    $wc = 0;
    $cc = 0;
    $lc = 0;
    
    open(IN, $file) || die " Cannnot open $file: $!";
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

    push(@list_wc,$wc);
    push(@list_cc,$cc);
    push(@list_lc,$lc);
    
    print "$lc $wc $cc $file\n";
    close(IN) || die "Cannnot clone $file: $!";
}



for my $count(@list_wc){
    $total_wc += $count;
}
for my $cc(@list_cc){
    $total_cc += $cc;
}
for my $lc(@list_lc){
    $total_lc += $lc;
}


print "$total_lc $total_wc $total_cc TOTAL\n";




