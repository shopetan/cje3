%a = ('kuma' => 'x1','neko' => 'x2','kiji' => 'x3','saru' => 'x4');
%a = %b;

%a = ('kuma' => 70,'neko' => 50,'kiji' => 60,'saru' => 90);
foreach $key (sort keys %x) {
    print "$key\t$x{$key}\n"
}

%x = ('kuma' => 70,'neko' => 50,'kiji' => 60,'saru' => 90);
foreach $key (
sort {$x{$b} <=> $x{$a}} keys %x) {
    print "$key\t$x{$key}\n"
}
