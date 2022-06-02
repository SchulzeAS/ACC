# ACC - Aspell Comment Checker
Comment checking using aspell

### Requires:
```
aspell
perl>=v5
```

### How it works:
usage: ./acc \<mode> \<file> \(\<aspell options>)
```
<mode>            must be a valid perl file that removes everything that is not
                  a comment or a string in the code.
<file>            the target file
optional:
<aspell options>  options that are directly passed to aspell
```
