@input = <STDIN>;
print("\n\n");
while ($input[$count] ne "") {
# single line comment
# perl does not support lookarounds (I think),
# so this is ugly
if($input[$count] =~ /\#(?!\=)(.*)/){
print($input[$count]) unless ($input[$count] =~ /\=\#/);
} elsif($input[$count] =~ /#=(.*)/){
	until($input[$count] =~ /\=\#/){
	print($input[$count]);
	$count++;
	}

}


$count++;
}

