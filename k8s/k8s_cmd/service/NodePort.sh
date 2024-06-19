# *NodePort: can directly map your pod to NodeIp:NodePort. 
# *NodePort is between 30000 ~ 32767, and set by k8s.

# Create a service to expose a pod
kubectl expose po [podName] --port=80 --target-port=8080 --type=NodePort

# Create a service to expose a deployment
kubectl expose deploy [deployName] --port=80 --target-port=8080 --type=NodePort --name=frontend

# Deploy the service
kubectl apply -f [definition.yaml]

# get the service list
kubectl get svc (-o wide)

# describe the service
kubectl describe svc [ServiceName]

# delete the service
kubectl delete -f [definition.yaml]
kubectl delete svc [ServiceName]

