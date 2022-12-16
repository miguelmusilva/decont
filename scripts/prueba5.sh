

#mamba install -y cutadapt

mkdir -p out/cutadapt
mkdir -p log/cutadapt


for secuencia in $( ls out/merged/*.fastq.gz | sed "s:out/merged/::" | sed "s:.fastq.gz::")
do
	cutadapt -m 18 -a TGGAATTCTCGGGTGCCAAGG --discard-untrimmed -o out/cutadapt/$secuencia.fastq.gz out/merged/$secuencia.fastq.gz > log/cutadapt/$secuencia.log
done

# TODO: run cutadapt for all merged files



#-A ??

