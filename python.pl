@input = <STDIN>; 
# This does not check the multiline unassigned string
# hack that is used, because it is pretty much impossible to discern between a comment and a string. 
# Also it is not the intended way of using python, I hope. 
while ($input[$count] ne "") {
if($input[$count] =~ /#(.*)/){
print($1."\n");
}
$count++;
}

