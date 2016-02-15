@stopwords = ("a","and","an","in","of","the","on","to","by","is");

my @index = ();
push @index, <STDIN>;
$isIncludeStopword = 0;

foreach $index(@index){
    chomp($index);
    foreach $stopword(@stopwords){
	@word = split(/ /,$index);
        if(@word[1] eq $stopword){
            $isIncludeStopword = 1;
        }
    }
    if(!$isIncludeStopword){
        print "$index\n";
    }
    $isIncludeStopword = 0;
}
