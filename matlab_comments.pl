@input = <STDIN>;
while ($input[$count] ne "") {
# DISCLAIMER:
# THIS WAS CREATED AFTER THE VERSION OF MATLAB WITH STRING SPELLCHECKING, 
# BY CUTTING OUT CUT AND THERE MIGHT BE VARIABLES LEFT OVER OR SOME THINGS
# DONE IN WAYS TAKEN THAT DO NOT MAKE SENSE TO ANYONE.
# also the comments in this file might not check out. 
if($input[$count] =~ m/'.*'|%/g ){
    #discern between comments or lines that have quotes
    #lines we care about might look like this:
    # <code>|<stringcode> <comment>
    # <stringcode>
    # <comment>
    # where <stringcode> contains singlequote delimited strings
    # debug = 2 => Production 
    $debug = 2;
    # sometimes there are double singlequotes ('') remove them because
    # they only cause confusion and are not relevant for parsing
    $input[$count] =~ s/''//g;
    # this is needed, otherwise the next if will never be executed, even
    # though it might match. This might be due to something like persistent
    # captures, but I am not entirely sure.
    $trash=$input[$count] =~ m/[^A-Z]'.*'.*%/g;
      if ($input[$count] =~ m/[^A-Z]'.*'.*%/g)  {# <stringcode> <comment>
          if($debug == 1){$input[$count] = "codecomment ".$input[$count];}
          # match preceeding strings
          # setup some variables used later
          $strings = "";
          $temp = "";
          $comment ="";
          while($input[$count] =~ /[^A-Z]'.*?'/gp ) {
          $temp = $temp.${^MATCH}." ";
          }
          # split the line on the %-sign
          @words = split /% /, $input[$count], 2;
          # words[0] contains <stringcode>, words[1] contains <comment>
          if($debug == 1){print @words[0]."\n".@words[1];}
          if($debug == 1){print $input[$count];}
          # parse strings out of words[0]
          while(@words[0] =~ /[^A-Z]'.*?'/gp ) {
          $strings = $strings.${^MATCH}." ";
          }
          # parse comment from words[1]
          $comment = @words[1];
          if($debug == 1){print $strings."|".$comment."\n";}

          $input[$count] = $comment;
          } elsif ($input[$count] =~ m/^(%.*)/g){# <comment>
          # remove the leading %
          $input[$count] = substr($input[$count],1);
          # iterate until there are no %s left
          while($input[$count] =~ m/^(%.*)/g ) {
            $input[$count] = substr($input[$count],1);
          }
          if($debug == 1){$input[$count] = "comment        ".$input[$count];}
      }  elsif ($input[$count] =~ m/.*%/g) {# <code> <comment>
          $input[$count] =~ s/(.*)(%)//g;
          if($debug == 1){$input[$count] = "commentafter   ".$input[$count];}
      }
      } else  {
          # delete the line because we do not care
          $input[$count] ="";
      }
  # increment the iterator
  $count++;
}
# only outputting if $debug == 2, else $debug = 1 then there is debug output 
if($debug == 2){
  print(@input);
}
