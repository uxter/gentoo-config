#!/bin/bash

export LC_ALL=C

utils=(
    "bash" "ld" "bison" "chown" "diff" "find" "gawk"
    "gcc" "g++" "ldd" "grep" "gzip" "m4" "make"
    "patch" "sed" "tar" "makeinfo" "xz"
)

for item in "${utils[@]}"; do
    $item --version | head -n 1;
done

echo "/bin/sh -> $(readlink -f /bin/sh)"

echo "/usr/bin/yacc -> $(readlink -f /usr/bin/yacc)";
echo "yacc: $(/usr/bin/yacc --version | head -n1)";

echo "/usr/bin/awk -> $(readlink -f /usr/bin/awk)";
echo "awk: $(/usr/bin/awk --version | head -n1)";

echo "perl: $(perl -V:version)";

bzip2 --version 2>&1 < /dev/null | head -n1

TMPC="__tmp_g_file__";
echo "#include <stdio.h>" > $TMPC.c
echo "int main(){" >> $TMPC.c
echo "printf(\"%s\n\", \"g++ OK\");" >> $TMPC.c
echo "}" >> $TMPC.c
g++ -o $TMPC $TMPC.c
./$TMPC
rm -f $TMPC.c $TMPC
unset TMPC
