print "line count | word count | char count\n";
@list_wc = ();
@list_cc = ();
@list_lc = ();

$total_wc = 0;
$total_cc = 0;
$total_lc = 0;

my %frequency_word;

foreach $file(@ARGV) {
    $wc = 0;
    $cc = 0;
    $lc = 0;
    
    open(IN, $file) || die " Cannnot open $file: $!";
    while($line = <IN>){
        chomp($line);
        @words = split(/ /,$line);
        
        for my $word(@words){
            if($word =~ m/^[A-Z]+/){
                $word =~ tr/A-Z/a-z)/;
            }
            if($word =~ m/(^[a-z]+)(\$*\.)/){
                $word =~ s/^([a-z]+)*(\$*\.)/$1/;
            }
            if($word =~ m/(^[a-z]+)(\$*\,)/){
                $word =~ s/^([a-z]+)*(\$*\,)/$1/;
            }
            if($word =~ m/(^[a-z]+)(\$*\-)/){
                $word =~ s/^([a-z]+)*(\$*\-)/$1/;
            }
            if($word =~ m/(^[a-z]+)(\$*er)/){
                $word =~ s/(^[a-z]+)*(\$*er)/$1/;
            }
            elsif($word =~ m/(^[a-z]+)(\$*est)/){
                $word =~ s/(^[a-z]+)*(\$*est)/$1/;
            }
            elsif($word =~ m/(^[a-z]+)(\$*tion)/){
                $word =~ s/(^[a-z]+)(\$*tion)/$1te/;
            }
            elsif($word =~ m/(^[a-z]+)(\$*s)/){
                $word =~ s/(^[a-z]+)*(\$*s)/$1/;
            }

            if (exists($frequency_word{$word})){
                $frequency_word{$word}++;
            }else{
                $frequency_word{$word} = 1;
            }
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

foreach my $key (sort { $frequency_word{$b} <=> $frequency_word{$a} } keys %frequency_word){
    print "$key: $frequency_word{$key}\n";
}
