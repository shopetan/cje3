$file = '../README.md';
open(IN, $file) || die " Cannnot open $file: $!";
while($line = <IN>){
    chomp($line);
    print "$line\n";
}

clone(IN) || die "Cannnot clone $file: $!";


open(OUT,"  > $file") || die " Cannnot open $file: $!";
while($line = <IN>){
    chomp($line);
    print OUT "$line\n";
}

clone(IN) || die"Cannnot clone $file: $!";

