
### CUTADAPT SCRIPT ###

mkdir -p out/trimmed
mkdir -p log/cutadapt

for file in out/merged/*.fastq.gz
do
	sid=$(basename $file .fastq.gz)
	if [[ ! -e log/cutadapt/$sid.log ]]
	then
		cutadapt -m 18 \
		 	 -a TGGAATTCTCGGGTGCCAAGG \
		 	 --discard-untrimmed \
		 	 -o out/trimmed/$sid.trimmed.fastq.gz out/merged/$sid.fastq.gz \
		 	 > log/cutadapt/$sid.log
	else
		echo 
	fi
done
