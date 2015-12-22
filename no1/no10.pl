$file1 = './sample1.txt';
open(IN, $file1) || die " Cannnot open $file: $!";

@list =();

while($line = <IN>){
    chomp($line);
    push(@list,$line);
}
close(IN) || die "Cannnot clone $file: $!";

$file2 = './sample2.txt';
open(IN, $file2) || die " Cannnot open $file: $!";
while($line = <IN>){
    chomp($line);
    push(@list,$line);
}
close(IN) || die "Cannnot clone $file: $!";

@list = sort @list;
for my $line(@list){
    print "$line\n";
}
