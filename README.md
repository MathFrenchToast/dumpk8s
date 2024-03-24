# dumpk8s
a bash script to dump all ressources of a k8s cluster

## usage
be sure to:
- have kubectl and jq install (see docker image if needed)
- be connected to your kube (see article)

then  
`k8sexport [-n directoryname] [-f {yaml|json}]`  
will produce a main directory named `directoryname`
in this directory the definition of the cluster namespace-independant ressources  
then a sub directory per namespace  
and one file per kind of ressource following the format given by `-f`

## todo
[ ] add an option to not dump empty ressources type



