
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
