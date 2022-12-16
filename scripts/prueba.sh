
#file="/home/vant/decont/data/urls"
lines=$(cat $1)
#downloadFolder="/home/vant/decont/data"

echo $1
echo $2
echo $3

for line in $lines
do
	echo $line
	wget $line -P $2
done



#if [[ $3 == *"yes"* ]]; then
	gunzip -k $2/*.gz
	
	if [ ! -z "$4" ]; then
    		echo "1st argument supplied"
    		for file in $2/*.fastq
    		do
    			echo $file
    			sed -i "/$4/{N;N;N;d}" $file
    		done 
	fi
#fi




#-k: no elimina los .gz
# N: 

