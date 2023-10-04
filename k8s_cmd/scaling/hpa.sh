#* HPA: Horizontal Pod AutoScaling.
# Pods must have requests and limits defined.
# HPA uses the k8s metrics server, and checks the metrics server every 30 seconds.
# !note that docker desktop does not have metrics server, you have to download it manually.
# scale according to the min and max number or replicas defined.

# create hpa
kubectl autoscale deployment [name] --cpu-percent=50 --min=3 --max=10
kubectl apply -f [definition.yaml]

# get the auto scaler status
kubectl get hpa [name]

# delete hpa
kubectl delete hpa [name]
kubectl delete -f [definition.yaml]