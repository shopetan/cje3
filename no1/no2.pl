while($line = <STDIN>){
    chomp($line);
    if($line eq 'bye'){
        print "good bye\n";
            last;
    }elsif($line eq 'hello'){
        print "hello\n";
    }else{
        print "fuck\n";
    }

}
