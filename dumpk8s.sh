#!/bin/bash

# default values
format="yaml"
name="k8sexport"

# Get the options
while getopts ":h:n:f:" option; do
   case $option in
      h) echo "use k8sexport [-n directoryname] [-f {yaml|json}]"
         exit;;
	  n) name=$OPTARG;;
      f) format=$OPTARG;;	  
     \?) echo "Error: Invalid option"
         exit;;
   esac
done

# loop over a list of ressource kind and dump them in the given format as file 
# create a directory per namespace a file per kind
# to find and expand this list : `kubectl api-resources`
mkdir -p $name
cd $name
for line in $(kubectl get namespaces -o json | jq -r .items[].metadata.name)
do
  echo "processing ns $line"
  mkdir -p ./$line  
  for resstype in cm secret deployment service ingress job cronjobs pvc pv hpa ds
  do
    kubectl -n $line get $resstype -o $format > $line/$resstype.yml  
  done
done
cd ..