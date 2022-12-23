
### INDEX SCRIPT ###

# $1 : file raw contaminants sequence
# $2 : output directory


mkdir -p $2

if [[ ! -e $2/Log.out ]] # Checking if already exists
then
	STAR    --runThreadN 4 \
		--runMode genomeGenerate \
		--genomeDir $2 \
		--genomeFastaFiles $1 \
		--genomeSAindexNbases 9
	echo -e "\n########## $2 index succesfully made ##########\n"
else
	echo -e "\n########## Index already exists. The script will continue ##########\n"
fi
