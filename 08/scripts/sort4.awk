{
    if ($9 ~ /^[45]/)
        IP[$1] = $1
}

END {
    asorti(IP, SORTED, "@val_num_asc");
    j = length(SORTED);
    for (i = 1; i <= j; i++) {
        print IP[SORTED[i]]
    }
}

