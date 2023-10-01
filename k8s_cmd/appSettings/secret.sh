#* Secrets is similiar to config maps, it store key-value pairs.
#* secrets is stored in base64 format now, which makes it not that secure.
# to quickly encode/decode strings into base64: https://www.toolhelper.cn/EncodeDecode/Base64EncodeDecode

# create
kubectl create secret generic [secretName] --from-literal=STATE=Michigan
kubectl apply -f [definition.yaml]

# list
kubectl get secrets

# save to yaml
kubectl get secrets [secretName] -o YAML

# delete a secret
kubectl delete -f [definition.yaml]
kubectl delete secrets [secretName]