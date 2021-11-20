# Kubernetes
Collection of commmands for using with Kubernetes

Basic kubectl commands to remember:
```
kubectl get nodes
kubectl get deployments
kubectl create deployment {name} --image={image-path}
kubectl proxy
```

```
kubectl describe - show detailed information about a resource

kubectl logs - print the logs from a container in a pod
kubectl logs k8-sandbox-5b9b64bf6c-mt78h -c super-api
journalctl

kubectl exec - execute a command on a container in a pod
kubectl exec <pod-name> <command>
kubectl exec -it <pod-name> /bin/bash
```

```
kubectl expose deployment/{deployment-name} --type="NodePort" --port 8080

export NODE_PORT=$(kubectl get services/{service-name} -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT
```

```
kubectl set image deployment/nginx-deployment nginx=nginx:1.16.1 --record
kubectl set image deployment/k8-sandbox super-api=heinrichr/super-api:22-09-2021 --record
```