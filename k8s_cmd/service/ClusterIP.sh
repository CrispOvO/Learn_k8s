#* ClusterIP: the ip of pods change when they die, so you need to use service to simplify your operation.
#* Pod IPs are unreliable but service IPs are Durable.
#* we reach pods by going through their services, service will load balance between those pods.

# Create a service to expose a pod
kubectl expose po [podName] --port=[ServicePort] --target-port=[PodTargetPort] --name=[ServiceName]

# Create a service to expose a deployment
kubectl expose deploy [deploymentName] --port=[ServicePort] --target-port=[DeploymentTargetPort] --name=[ServiceName]

# deploy the service
kubectl apply -f [definition.yaml]

# get the services list
kubectl get svc (-o wide)

# describe the service
kubectl describe svc [serviceName]

# delete the service
kubectl delete -f [definition.yaml]
kubectl delete svc [serviceName]