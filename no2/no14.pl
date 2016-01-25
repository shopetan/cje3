$file1 = './test1.txt';
open(IN, $file1) || die " Cannnot open $file: $!";

@list =();

while($line = <IN>){
    chomp($line);
    
    if($line =~ m/([A-Z]+)([0-9]+)/){
        $line =~ tr/A-Z/a-z)/;
        print "line = $line\n";
        
    }
    
}
close(IN) || die "Cannnot clone $file: $!";

