# get the current context
kubectl config current-context

# list all the context
kubectl config get-contexts

# use a context
kubectl config use-context [contextName]

# rename context
kubectl config rename-context [old-name] [new-name]

# delete context
kubectl config delete-context [contextName]

# output yaml file
kubectl create deploy mynginx --image=nginx --port=80 --replicas=3 --dry-run=client -o yaml

# deploy container use imperative methods
kubectl create deployment [name] --image=[imageName]

# deploy container use declarative way
kubectl create -f [yamlFile]

# clean up
kubectl delete deployment [name]
kubectl delete deploy [name]

# show all the namespaces
kubectl get namespace
kubectl get ns

# set the current context to use a namespace
kubectl config set-context --current --namespace=[namespaceName]

# create a namespace
kubectl create ns [namespaceName]

#! delete a namespace, use with caution
kubectl delete ns [namespaceName]

# list all pods in namespaces
kubectl get pods --all-namespaces 
kubectl get pods -n [namespaceName]

# get a list of all installed nodes
kubectl get nodes

# get some info about the node/pods/...
kubectl describe node/pods/...

# create a pod through file
kubectl create -f [pod-definition.yaml]

# run a pod
kubectl run [podname] --image=[img] -it -- /bin/sh -c "sleep 3600"

# list the running pods
kubectl get pods (-o wide)

# show pod info 
kubectl describe pod [podname]

# extract the pod definition in yaml and save it to a file
kubectl get pod [podname] -o yaml > file.yaml

# interactive mode
kubectl exec -it [podname] -- /bin/sh

# delete a pod(delete by file is also by reading podname)
kubectl delete -f [pod-definition.yaml] (--force --grace-period=0)
kubectl delete pod [podname]

# get service endpoint
kubectl get ep myservice

# port forward to service again
kubectl port-forward service/myservice [yourPort]:[servicePort]

# exec into a container of one pod, if not picked, will enter default container
kubectl exec -it [podname] -c [containerName] -- sh

# get the logs for a container
kubectl logs [podName] -c [containerName]

# create a ReplicaSet
kubectl apply -f [replicaset.yaml]

# list ReplicaSets(rs)
kubectl get rs (-o wide)

# Get info
kubectl describe rs [rsName]

# delete a rs
kubectl delete -f [replicaset.yaml]
kubectl delete rs [rsName]

# create a deployment, this will also create a ReplicaSet
kubectl apply -f [deployment.yaml]

# list deployments
kubectl get deploy

# get info 
kubectl describe deploy [deploymentName]

# delete a deployment
kubectl delete -f [deployment.yaml]
kubectl delete deploy [deploymentName]

# update deployment file
kubectl apply -f [deployment.yaml]

# *DaemonSet: an instance running on all the nodes of the cluster. 
# *after the daemonset is created, all the newly created nodes will be added with a daemonset pod.
# create a daemon set
kubectl apply -f [daemonset.yaml]

# list daemon sets
kubectl get ds

# ? get info using rs name, note that each ds is a rs
kubectl describe ds [rsName]

# delete a daemon set
kubectl delete -f [daemonset.yaml]
kubectl delete ds [dsName]

#? StatefulSets: stateful set allows you to use multiple pods as databases(actually I don't know the use of it)
#* better use cloud provider's storage

# create
kubectl apply -f [statefulsets.yaml]

# list
kubectl get sts

# info
kubectl describe sts [Name]

# delete
kubectl delete -f [statefulsets.yaml]

# *Job: job is a workload for short live tasks, and will complete when pods is successfully finished.
# create a job
kubectl apply -f [job.yaml]

# list jobs
kubectl get job

# get info 
kubectl describe job [jobName]

# delete a job
kubectl delete -f [job.yaml]
kubectl delete job [jobName]

# *Cron Job: Provides a method of executing jobs on a cron-like schedule.
# create a job, all is * means run every minutes
kubectl create cronjob [jobName] --image=busybox --schedule="* * * * *" -- bin/sh -c "date;"
kubectl apply -f [cronjob.yaml]

# list cronjobs
kubectl get cj

# get info
kubectl describe cj [jobName]

# delete a cronJob
kubectl delete -f [cronjob.yaml]
kubectl delete cj [jobName]

#* Rolling Update: allow you to update your pod, while keeping some of it running. making update smooth.
# update a deployment
kubectl apply -f [deployment.yaml]

# get the progress of the update
kubectl rollout status

# get the history of the deployment
kubectl rollout history deployment [deploymentName]

# rollback to a revision number
kubectl rollout undo [deploymentName] --to-revision=[revision#]

#* Blue-Green Deployments: create all the new pods, and then change service pointing.
# update service yaml file
kubectl apply -f [service.yaml]

# list the pods in kube-system
kubectl get po -n kube-system




