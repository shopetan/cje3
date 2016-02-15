my @index = ();
push @index, <STDIN>;

foreach $index(@index){
    chomp($index);
    &stemming($index);
}

sub stemming {
    $index = $_[0];
    @words = split(/ /,$index);
    if(@words[1] =~ m/^[A-Z]+/){ @words[1] =~ tr/A-Z/a-z)/; }
    if(@words[1] =~ m/(^[a-z]+)(\$*\.)/){ @words[1] =~ s/^([a-z]+)*(\$*\.)/$1/; }
    if(@words[1] =~ m/(^[a-z]+)(\$*\,)/){ @words[1] =~ s/^([a-z]+)*(\$*\,)/$1/; }
    if(@words[1] =~ m/(^[a-z]+)(\$*\-)/){ @words[1] =~ s/^([a-z]+)*(\$*\-)/$1/; }

    if(@words[1] =~ m/(^[a-z]+)(\$*er)/){ @words[1] =~ s/(^[a-z]+)*(\$*er)/$1/; }
    elsif(@words[1] =~ m/(^[a-z]+)(\$*est)/){ @words[1] =~ s/(^[a-z]+)*(\$*est)/$1/; }
    elsif(@words[1] =~ m/(^[a-z]+)(\$*tion)/){ @words[1] =~ s/(^[a-z]+)(\$*tion)/$1te/; }
    elsif(@words[1] =~ m/(^[a-z]+)(\$*s)/){ @words[1] =~ s/(^[a-z]+)*(\$*s)/$1/; }
    print "@words[0] @words[1]\n";
}
