my @index = ();
push @index, <STDIN>;
$isFirstTerm = 0;
$totalDocumentNum = 0;

my %tf = ();
my %idf = ();
my %calcIdf = ();

foreach $index(@index){
    $isIncludeDoc = 0;
    chomp($index);
    @term = split(/ /,$index);
    
    if(!$isFirstTerm){
	$totalDocumentNum = $index;
	$isFirstTerm = 1;
    }
    else {
	if(!exists($tf{@term[0]}{@term[1]})){
	    $tf{@term[0]}{@term[1]} = @term[2];
	}
	
	if(!exists($calcIdf{@term[1]}{@term[0]})){
	    $calcIdf{@term[1]}{@term[0]} = @term[2];
	}
    }
}
print "$totalDocumentNum\n";
foreach $term (sort keys %calcIdf) {
    $isFirstTerm = 0;
    foreach $docid (sort keys %{$calcIdf{$term}}) {
	$num = keys %{$calcIdf{$term}};
	$idf = log($totalDocumentNum/$num) + 1;
	if(!$isFirstTerm){
	    $idf{$term} = $idf;
	    #print "idf($term) = $idf\n";
	    $isFirstTerm = 1;
	}
    }
}

foreach $docid (sort keys %tf) {
    foreach $term (sort keys %{$tf{$docid}}) {
	$tfidf = $tf{$docid}{$term}*$idf{$term};
	print "$docid $term $tf{$docid}{$term} $idf{$term} $tfidf\n";
    }
}
