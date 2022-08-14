
## Install the kubernetes dashboard
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.1/aio/deploy/recommended.yaml
```

```
kubectl proxy
```

```
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```

## Get a login Token 
```
kubectl -n kubernetes-dashboard create token admin-user
```


## Metric Server 
```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.6.1/components.yaml
```

kubectl delete -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.6.1/components.yaml


## Helm

Before you can install the chart you will need to add the metrics-server repo to .

``
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
```

After you've installed the repo you can install the chart.

```
helm upgrade --install metrics-server metrics-server/metrics-server
```
