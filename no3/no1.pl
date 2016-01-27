# tf_idf

$idf{'dog'} = 2.5;
$idf{'cat'} = 1.6;
$idf{'year'} = 3.3;

$tf{'dog'}{'D001'} = 10;
$tf{'dog'}{'D002'} = 3;
$tf{'dog'}{'D005'} = 22;
$tf{'dog'}{'D001'} = 10;
$tf{'dog'}{'D009'} = 7;
$tf{'cat'}{'D002'} = 14;
$tf{'dog'}{'D001'} = 10;
$tf{'cat'}{'D009'} = 6;
$tf{'year'}{'D003'} = 9;
$tf{'year'}{'D005'} = 8;
$tf{'year'}{'D007'} = 10;
$tf{'year'}{'D009'} = 2;
$tf{'year'}{'D010'} = 2;

print "=== IDF ===\n";
foreach $term (sort keys %idf) {
    print "idf($term) = $idf{$term}\n";
}
print "\n";

print "=== TF ===\n";
foreach $term (sort keys %tf) {
    foreach $docid (sort keys %{$tf{$term}}) {
        print "tf($term,$docid) = $tf{$term}{$docid}\n";
    }
}

print "\n";
print "=== TF*IDF ===\n";
foreach $term (sort keys %tf) {
    foreach $docid (sort keys %{$tf{$term}}) {
        $tfidf = $tf{$term}{$docid} * $idf{$term};
        print "tf*idf($term,$docid) = $tfidf \n";
    }
}
