# Introduction Kubernetes

Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications. https://kubernetes.io/

We are using minikube

The simplest way to deploy our app is to use the kubectl run command, which will create all the necessary components without having to deal with JSON or YAML. We'll run the image we pushed to Docker Hub earlier in Kubernetes:

## 

```
minikube start 
```

```
minikube dashboard
```

```
$ kubectl create deployment demo --image=timeless/docker-example
deployment.apps/demo created

```

```
$ kubectl get pods 
NAME                    READY   STATUS    RESTARTS   AGE
demo-75b47f64cb-dpx68   1/1     Running   0          116s
```

```
$ kubectl get deployment
NAME   READY   UP-TO-DATE   AVAILABLE   AGE
demo   1/1     1            1           4m39s
```

With our pod running, how do we access it?

Each pod gets its own IP address, howeer, this address is internal to the cluster and isn't accessible from outside of it. To make the pod accessible from the outside, we'll expose it through a Service object.

We need create a special service of type LoadBalancer, because if we create a regular service (a ClusterIP service), like the pod, it would also only be accessible from inside the cluster. By creating a LoadBalancer-type service, an external load balancer will be created and we can connect to the pod through the load balancer's public IP.

```
$ kubectl expose deployment demo --type=LoadBalancer --name=demo-service --port=8080

service/demo-service exposed
```

```
$ kubectl get svc
NAME           TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
demo-service   LoadBalancer   10.110.139.108   <pending>     8080:30674/TCP   57s
kubernetes     ClusterIP      10.96.0.1        <none>        443/TCP          9m46s
```

kubectl expose deployment demo --type=NodePort --name=demo-service --port=8080


The list shows two services. Ignore the kubernetes service for now and take a close look at the bodo-service we created. It doesn't have an external IP address yet, because it takes time for the load balancer to be created by the cloud infrastructure Kubernetes is running on. Once the load balancer is up, the external IP address of the service should be displayed, if the cloud infra is AWS or GCP. But unfortunately, we're on Minikube which doesn't support LoadBalancer services, so the service will never get an external IP.

Let's wait a while and list the services again as shown below:
However, we can access the service anyway with its external port by running:

```
minikube service demo-service
```

## Helper commands
```
kubectl get events
```

```
kubectl config view
```


##
Mac / Linux only on M1 processor

https://minikube.sigs.k8s.io/docs/handbook/accessing/#using-minikube-service-with-tunnel

```
$ ps -ef | grep docker@127.0.0.1


  501 17681 17668   0  9:52AM ttys004    0:00.01 ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -N docker@127.0.0.1 -p 49478 -i /Users/ts1/.minikube/machines/minikube/id_rsa -L 50792:10.110.146.196:8080
  501 18061 17769   0  9:53AM ttys005    0:00.00 grep docker@127.0.0.1
```