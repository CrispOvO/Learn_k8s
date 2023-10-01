#* StorageClass describes the "classes" of storage offered by the admin.
#* StorageClass is an abstraction on top of an external storage resource.
#* No need to set a capacity.
#* Eliminates the need for the admin to pre-provision a persistent volume.
# another kind of PV, not pvc.

# deploy the storage class or pvc.
kubectl apply -f [definition.yaml]

# get the storage class list
kubectl get sc

# get the pvc list
kubectl get pvc

# describe the storage class
kubectl describe sc [className]

# delete the sc and pvc
kubectl delete -f [definition.yaml]
kubectl delete sc [className]
kubectl delete pvc [pvcName]