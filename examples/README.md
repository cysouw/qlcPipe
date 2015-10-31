# Example pipelines

## partitioning

Poor-man's cognate classes: read table, select column, compute similarities, partition similarities, add column name, add  column to original file

    cat ALE_sun.tsv | cut -f5 | tail -n +2 | ../R/simstrings -d | ../R/partition | cat <(echo Cogid) <(cat -) | paste ALE_sun.tsv - > test.txt

Takes rather long. Within R this basically works very quick! This pipeline is clearly not optimal

Using Python, the attempt `align` is just a quick hack. I'm not very good in python...

    cat ALE_sun.tsv | cut -f5 | tail -n +2 | head -10 | ../Python/align > testalign.txt

