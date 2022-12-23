
### DOWNLOAD SCRIPT ###

wget -N -i $1 -P $2 # Download and overwrite all files only if they are newer

lines=$(cat $1) # md5 check to the download files
for line in $lines
do
	online_md5= curl -sL $line.md5 | md5sum | cut -d ' ' -f 1
	local_md5= md5sum $2/$(basename $line)
	if [[ $online_md5 == $local_md5 ]]
	then
		echo -e "\nHurray, they are equal. The script will continue\n"
	else
		echo -e "\n:(. Sorry. This is quite problematic\n"
		exit 0
	fi	
done

if [[ $3 == "yes" ]] # Uncompressed the file only if third argument is yes
then
	if [[ ! -e $2/$(basename $1).fasta ]]
	then
		gunzip -k $2/*.gz
	fi
fi	

if [ ! -z "$4" ] # Si existe algun argumento en $4, se eliminaran las coincidencias
then
	seqkit grep -v -r -p "$4" -n $2/$(basename $1).fasta > $2/$(basename $1)_filtered.fasta
	echo -e "\n########## $(basename $1) filtered effortlessly ##########\n"
fi

echo -e "\nAll files are downloaded correctly, not corrupted and ready for use\n"
