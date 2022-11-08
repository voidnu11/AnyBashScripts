BEGIN {
    l=0
}

{
    if ($9 ~ /^[45]/) {
        REQUEST[l] = $7
        CODE[l++] = $9
    }
}

END {
    for (i = 1; i <= l; i++) {
        printf "%s\t%s\n", REQUEST[i], CODE[i]
    }
}

