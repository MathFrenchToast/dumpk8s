# dumpk8s
a bash script to dump all ressources of a k8s cluster.  

Not all existing K8S kind of ressources is managed,
you can expand the list by adding ressources name to the for loop.

## usage
be sure to:
- have kubectl and jq install (see docker image if needed)
- be connected to your kube (see article/book "from Docker to K8s")

then  
`k8sexport [-n directoryname] [-f {yaml|json}]`  
will produce a main directory named `directoryname`
in this directory the definition of the cluster namespace-independant ressources  
then a sub directory per namespace  
and one file per kind of ressource following the format given by `-f`

## expand ressources list
to find the available ressources run : `kubectl api-resources`
you can add any NAMESPACED=false KIND to the first loop.
and any other into the second loop

## todo
[ ] add an option to not dump empty ressources type
[ ] auto discover all ressources type both namespaced or not
