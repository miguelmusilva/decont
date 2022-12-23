
### MERGE FILES SCRIPT ###

# $1 = Input Directory
# $2 = Output Directory
# $3 = Sample ID 

mkdir -p out/merged

if [[ ! -e out/merged/$3.fastq.gz ]] #Checking if already exists
then
	cat $1/$3*.fastq.gz > $2/$3.fastq.gz
	echo -e "\n########## $3 correctly merged ##########\n"
else
	echo -e "\n########## $3 had already been merged ##########\n"
fi
