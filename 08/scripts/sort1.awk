BEGIN {
    l=0
}

{
    LINE[l] = $R
    CODE[l++] = $9
}

END {
    asorti(CODE, SORTED_BY_CODE, "@val_num_asc");
    j = length(SORTED_BY_CODE);
    for (i = 1; i <= j; i++) {
        print LINE[SORTED_BY_CODE[i]]
    }
}
