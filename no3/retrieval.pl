my @index = ();
push @index,<STDIN>;
my %tfidf = ();

if(@ARGV != 1){
    print STDERR "Usage: $0 <index file>\n";
    exit;
}

$file = @ARGV[0];
open(IN, $file) || die " Cannnot open $file: $!";
while($line = <IN>){
    chomp($line);
    @term = split(/ /,$line);
    if(!exists($tfidf{@term[1]}{@term[0]})){
	$tfidf{@term[1]}{@term[0]} = @term[4];
    }
}

foreach $index(@index){
    chomp($index);
    @tmp = split(/ /,$index);
    push @querys,@tmp[1];
}

foreach $term (sort keys %tfidf) {
    foreach $docid (sort keys %{$tfidf{$term}}) {
	foreach $query (@querys){
	    if($term eq $query){
		if(!exists($result{$docid})){
		    $result{$docid} = $tfidf{$term}{$docid};
		}else{
		    $result{$docid} += $tfidf{$term}{$docid};
		}
	    }
	}
    }
}
$hit = keys %result;
print "hit = $hit\n";

for my $key (sort {$result{$b} <=> $result{$a} || $a cmp $b} keys %result) {
    print $key . " " . $result{$key} . "\n";
}
