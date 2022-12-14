# Download the contaminants fasta files, uncompress it, and
# filter to remove all small nuclear RNAs





echo ¿Donde quiere guardar su secuencia de contaminantes?
read varname1 
echo ¿Desea descomprimir su secuencia?
read varname2

wget https://bioinformatics.cnio.es/data/courses/decont/contaminants.fasta.gz -P $varname1


if [[ $varname2 == "yes" ]]; then 
	gunzip -k $varname1/*.gz
fi



