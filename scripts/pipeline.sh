
### DECONTAMINATION OF SMALL-RNA SEQUENCING SAMPLES SCRIPT ###

# Cleanup script
bash scripts/cleanup.sh

### CONFIRMATION SCRIPT ###

programs=("fastqc" "seqtk" "cutadapt" "star" "multiqc") # Programs required for the entire script

echo "********** DECONTAMINATION OF SMALL-RNA SEQUENCING SAMPLES **********"
echo "The decontamination of RNA sequencing script is about to start. ¿Are you sure (y/n)?"
read answer

if [[ $answer = *[Nn]* ]] 
then
	echo ·········· The script will not be launched ··········
	exit 1
elif [[ $answer = *[Yy]* ]]
then
	echo ·········· The script will be launched. Take a coffee and relax ··········
	for program in ${programs[@]} # Check the necessary programs list and download those non-existent 
	do
		which $program > /dev/null
		if [ $? -eq 1 ]
		then
			mamba install -y $program
		fi
	done
fi

# Download samples sequence
bash scripts/download.sh data/urls data 

# Download contaminants database fasta
bash scripts/download.sh data/contaminants res yes "small nuclear"

# Index the contaminants files
bash scripts/index.sh res/contaminants_filtered.fasta res/contaminants_idx

# Merge the samples into a single file > merged files
for sid in $( ls data/*.fastq.gz | sed "s:data/::" | cut -d "-" -f1 | sort -u)
do
	bash scripts/merge_fastqs.sh data out/merged $sid
done

#JUST CURIOSITY
mkdir out/fastqc
fastqc -o out/fastqc out/merged/*.fastq.gz

# Cutadapt method for all merged files > trimmed files
bash scripts/cutadapt.sh

# STAR method for all trimmed files
bash scripts/star.sh

# Create a report for the pipeline in two different ways 
mkdir -p out/multiqc
multiqc -o out/multiqc ./
open out/multiqc/multiqc_report.html

bash scripts/log.sh

echo -e "########## DECONTAMINATION OF SMALL-RNA SEQUENCE SAMPLES SCRIPT IS FINISHED ##########"
