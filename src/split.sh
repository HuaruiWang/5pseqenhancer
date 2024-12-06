ref_cog=$1
out_dir=$2
for i in {A..Z}
do
  cat $ref_cog |awk -v i=$i -v FS='\t' -v OFS='\t' '$NF == i {NF--; print}'  >$out_dir/meta_${i}.gff
done