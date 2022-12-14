

mamba install -y star

mkdir res/contaminants_idx

echo ¿Dónde quieres guardar el archivo generado?
read varname3

echo ¿De que secuencia deseas realizar el indexado?
read varname4

STAR --runThreadN 4 --runMode genomeGenerate --genomeDir res/$varname3 --genomeFastaFiles res/$varname4 --genomeSAindexNbases 9
