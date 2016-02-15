$isText = 0;

if(@ARGV != 1){
    print STDERR "Usage: $0 <document file>\n";
    exit;
}

$file = @ARGV[0];
open(IN, $file) || die " Cannnot open $file: $!";
while($line = <IN>){
    chomp($line);
    if ($line =~ /<NUM>(.+)<\/NUM>/){
	$docid = $1;
    }
    if ($line =~ m/<\/TEXT>/){
	$isText = 0;
    }
    if ($isText){
	@words = split(/ /,$line);
	for my $word(@words){
	    print "$docid $word\n";
	}
    }
    if ($line =~ m/<TEXT>/){
	$isText = 1;
    }
}


