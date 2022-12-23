
### CLEAN-UP SCRIPT ###

arguments=("data res out log")
GLOBIGNORE=data/urls:data/contaminants:*/.gitkeep # These files will be ignored and not eliminated

echo "You are going to delete some/all created files. ¿Are you sure (Y/N)?"
read answer


if [[ $answer = *[Nn]* ]]
then
	echo -e "\nNone files will be eliminaed. Relax, everything is under control\n"
	exit
else [[ $answer = *[Yy]* ]]
	echo "Some files will be removed. Select the directory you would like to restart : data, res, out, log, all)"
	read cleandir
	
	if [ $cleandir = "all" ]
	then
		echo -e "\n########## Deleting all created files ##########\n"
		rm -r data/* res/* out/* log/*
	else
		for argument in ${arguments[@]}
		do
			if [ $argument == $cleandir ]
			then
				echo -e "\n########## $cleandir will be eliminated ##########\n"
				rm -r $cleandir/* 
			fi
		done
	fi
fi

unset GLOBIGNORE

