
### CONFIRMATION SCRIPT ###

echo "**********DECONTAMINATION OF SMALL-RNA SEQUENCING SAMPLES**********"
echo "¿Are you sure you want to launch this script (y/n)?"
read answer

if [[ $answer = *[Nn]* ]] 
then
	echo "The script will not be launched"
	exit
elif [[ $answer = *[Yy]* ]]
then
	echo "The script will be launched. Take a coffee and relax"
fi
	
