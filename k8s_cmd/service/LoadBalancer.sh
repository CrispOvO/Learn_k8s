#* Load Balancer help you to balance request between pods.
#* since we are using docker desktop and that the docker desktop is mapped to localhost, to reach the service you need to use localhost.
#! when using a cloud provider, you would need to get a load balancer external IP address instead of localhost.

# Deploy the service
kubectl apply -f [definition.yaml]

# get the service list
kubectl get svc (-o wide)

# * describe the service, use this to find the public IP of load balancer.
kubectl describe svc [ServiceName]

# delete the service
kubectl delete -f [definition.yaml]
kubectl delete svc [ServiceName]