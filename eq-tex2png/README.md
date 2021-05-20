# Eq-tex2png

The utility converts Latex-snippets to PNG-images. It processes all the files in a given directory, where each file contains bare Latex-code (without need for any preamble or environment definitions). The way to call the utility is as follows.
```
. path/to/eq-tex2png/compile path/to/equations-directory
```
This creates the PNG-images in the directory where it is executed. Instead of a whole directory, one can also pass a single file as the argument, which will then be converted:
```
. path/to/eq-tex2png/compile path/to/equation.tex
```

## Note

For conversion to work, it may be necessary to modify /etc/ImageMagick-6/policy.xml by commenting out the line
```
<policy domain="coder" rights="none" pattern="PDF" />
```
which can and should be undone afterwards as it is a security measure in general.

Author: David J. Gonon
