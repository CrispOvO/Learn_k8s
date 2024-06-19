#* Persistent Volumes represent you assign a part of your storage to let them store the temporary data of pods.
#* Persistent Volume Claim is a claim to the PV, indicating how much storage you want to use in PV.
#! one pv can only bound to one pvc

# deploy the pvs and pvcs
kubectl apply -f [definition.yaml]

# get the pv and pvc list
kubectl get pv
kubectl get pvc

# describe the pv and pvc
kubectl describe pv [pvName]
kubectl describe pvc [pvcName]

# delete the pvs and pvcs
kubectl delete -f [definition.yaml]
kubectl delete pv [pvName]
kubectl delete pvc [pvcName]