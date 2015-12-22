@a = (2,6,10);
@b = @a;

@a = (2,6,10);
@b = (1,5,7);
$x = -3;
push(@a,$x);
$y = pop(@a);
unshift(@a,$x);
$y = shift(@a);
push(@a,@b);
