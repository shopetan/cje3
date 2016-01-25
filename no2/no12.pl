$file1 = './test.txt';
open(IN, $file1) || die " Cannnot open $file: $!";

@list =();

while($line = <IN>){
    chomp($line);
    if($line =~ m/[A-Za-z]+/){
        if(!($line =~ m/[0-9]+/)){
            print "$line\n"
        }
    }
    push(@list,$line);
}
close(IN) || die "Cannnot clone $file: $!";

