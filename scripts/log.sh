
### LOG SCRIPT ###

if [ ! -e out/final_log.log ]
then
	touch out/final_log.log
fi

for sid in $(ls out/star)
do
	if grep -Fq "$sid" out/final_log.log # Only $sid not in final file.log will be add. 
	then
		echo "$sid already analysed"
	else
		cutadapt_adapters=$(cat log/cutadapt/$sid.log | egrep "Reads with adapters")
		cutadapt_basepairs=$(cat log/cutadapt/$sid.log | egrep "basepairs")
		star_reads=$(cat out/star/$sid/Log.final.out | egrep "reads mapped")
		star_unique=$(cat out/star/$sid/Log.final.out | egrep "Uniquely")
		echo -e " MUESTRA ID $sid\n\n \
			  CUTADAPT METHOD\n        $cutadapt_adapters \n        $cutadapt_basepairs \n\n \
			  STAR METHOD\n$star_reads \n$star_unique \n\n" \
			  >> out/final_log.log	
	fi
done
