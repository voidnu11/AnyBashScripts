BEGIN { l=0 }

{
  if ($2 !~ /(\/dev\/shm|\/sys*)/ && $3 ~ /^(tmpfs|ext4)/) {
    LINE[l++] = $R
  }
}

END {
  asorti(LINE, SORTED, "@val_num_asc")
  for (i = 1; i <= l; i++)
    printf "%s\n", LINE[SORTED[i]]
}
