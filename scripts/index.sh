
### INDEX SCRIPT ###

# $1 : file raw contaminants sequence
# $2 : output directory


mkdir -p res/contaminants_idx

if [[ ! -e $2 ]] # Checking if already exists
then
	STAR    --runThreadN 4 \
		--runMode genomeGenerate \
		--genomeDir $2 \
		--genomeFastaFiles $1 \
		--genomeSAindexNbases 9
else
	echo "··········Index already exists. The script will continue··········"
fi




