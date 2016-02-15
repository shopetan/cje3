my @index = ();
push @index, <STDIN>;
my @docs = ();
$isFirstTerm = 0;

my %tf = ();

foreach $index(@index){
    $isIncludeDoc = 0;
    chomp($index);
    @term = split(/ /,$index);

    if(!$isFirstTerm){
	push @docs, @term[0];
	$isFirstTerm = 1;
    }
    
    foreach $doc(@docs){
	if(@term[0] =~ /$doc/){
	    $isIncludeDoc = 1;
	    last;
	}
    }

    if(exists($tf{@term[0]}{@term[1]})){
	$tf{@term[0]}{@term[1]}++;
    }else{
	$tf{@term[0]}{@term[1]} = 1;
    }
    
    if(!$isIncludeDoc){	
	push @docs, $term[0];
    }
    
}

my $totalDocumentNum = @docs;
print "$totalDocumentNum\n";

foreach $docid (sort keys %tf) {
    foreach $term (sort keys %{$tf{$docid}}) {
        print "$docid $term $tf{$docid}{$term}\n";
    }
}
