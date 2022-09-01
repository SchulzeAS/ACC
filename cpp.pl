@input = <STDIN>;
while ($input[$count] ne "") {
  # C(++) can have three different comment styles:
  # single line comments, indicated through '//'
  # multiline comments, like /* <LINES> */
  # multiline comments like // <COMMENT> \

  # single line comment after code
  if($input[$count] =~ /.*\;.*\/\//gp){
    # split the line along the double slash
    @words = split /\/\//, $input[$count], 2;
    # words[0] contains the code part
    # words[1] contains the comment part
    print(($count+1).": ".@words[1]);
  } elsif($input[$count] =~ /\/\//gp) {

    if($input[$count] =~ /\/\/.*\\/){
      # single line comment with a backslash at the end
      print(($count+1).": ".$input[$count]);
      $count++;
      # the next line cannot be a comment, because that would make the end in \ pretty useless
      print(($count+1).": ".$input[$count]);
    } else {
      # single line comment without a backslash at the end
      print(($count+1).": ".$input[$count]);
    }
  } elsif($input[$count] =~ /\/\*/gp) {
    # offset the count by -1, this is the most robust way
    # to check the starting line without too many workarounds
    $count = $count - 1;
    # check the lines starting here
    do {
      $count++;
      print(($count+1).": ".$input[$count]);
    } until($input[$count] =~ /\*\//gp)
  }

  $count++;
}
