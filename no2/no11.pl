$file1 = './test.txt';
open(IN, $file1) || die " Cannnot open $file: $!";

@list =();

while($line = <IN>){
    chomp($line);
    if($line =~ m/[A-Za-z0-9]{4}\./){
        print "$line\n"
    }
    
    elsif($line =~ m/[A-Za-z0-9]{5}/){
        print "$line\n"
    }
    push(@list,$line);
}
close(IN) || die "Cannnot clone $file: $!";

