#* Config Maps is used to decouple and externalize configuration.
#* Config Maps is referenced as environment variables.
#* created from manifests/files/directories.
#* It's static, which means that if you change values, the containers will have to be restarted to get them.
# you can use volume to solve static issue, Each key/value pair is seen as a file in the mounted directory, so that updates to values are reflected in containers.

# the imperative way to create a config map
kubectl create configmap literal-example --from-literal="key=value1" ( --from-literastate=Michigan )

# the declarative way to create
kubectl apply -f [definition.yaml]

# From a file or folder
kubectl create cm [name] --from-file=[key-value.txt]
kubectl create cm [name] --from-file=[folderPath]

# list the config maps (and save it in a yaml file)
kubectl get cm ([name] -o YAML)

# delete a config Map
kubectl delete -f [definition.yaml]
