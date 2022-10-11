# ACC - Aspell Comment Checker
Comment and String/character array checking using aspell

### Requires:
```
aspell
perl>=v5
```
### If you desire another mode, feel free to open an issue

### How it works:
usage: ./acc \<mode> \<file> \(\<aspell options>)
```
<mode>            must be a valid perl file that removes everything that is not
                  a comment or a string in the code.
<file>            the target file
optional:
<aspell options>  options that are directly passed to aspell
```

### typical call: 
`./acc matlab_comments_strings.pl "$(find . -type f -name "*.m")"`
### Assumptions that are made:
```
MATLAB:
transposes only occur on capital letters i.e vectors/matrices are always capitalized  
```
