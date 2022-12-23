
### STAR SCRIPT ###


for fname in out/trimmed/*.trimmed.fastq.gz
do
	sid=$(basename $fname .trimmed.fastq.gz)
	if [ ! -e out/star/$sid ]
	then
		mkdir -p out/star/$sid
		STAR --runThreadN 4 \
		     --genomeDir res/contaminants_idx \
		     --outReadsUnmapped Fastx \
		     --readFilesIn out/trimmed/$sid.trimmed.fastq.gz \
		     --readFilesCommand gunzip -c \
		     --outFileNamePrefix out/star/$sid/
		echo -e "\n########## $sid decontaminated successfully ##########\n"
	else
		echo -e "\n########## Sequences already decontaminated ##########\n"
	fi
done
