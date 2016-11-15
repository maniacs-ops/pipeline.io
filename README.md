<<<<<<< HEAD
![Datasticks Logo](https://s3-us-west-2.amazonaws.com/advancedspark.com/img/datasticks-logo.png)

### 100% Open Source, Continuously Train and Deploy Streaming ML and AI Pipelines

## Live Demo
* Click [here](http://demo.datasticks.com) for a live demo.  

**Note:  Do not load any sensitive data into this environment!**

## Docker Images
* Click [here](https://hub.docker.com/u/fluxcapacitor) for all Docker images

## Related Training and Workshops
* Click [here](https://github.com/fluxcapacitor/pipeline) for related training repo

## Setup Kubernetes Cluster
* Follow the instructions [here](https://github.com/fluxcapacitor/kubernetes.ml#setup-a-new-kubernetes-cluster).

## Setup Kubernetes Client CLI
* Follow the instructions [here](https://github.com/fluxcapacitor/kubernetes.ml#install-kubernetes-client).

## Clone this Repo including Submodules
```
git clone --recursive https://github.com/fluxcapacitor/datasticks.com
```

## Pull Latest Tips of Submodules
```
cd datasticks.com

git submodule update --recursive --remote && git pull --recurse-submodules
```

## Deploy Datasticks to Kubernetes Cluster
```
./bin/datasticks-up.sh
```

## Get all Service Host/IPs
```
kubectl get svc -w
```

## (Optional) Setup Friendly CNAMEs in DNS Pointing to Service Host/IPs above
* ie. AWS Route53 REST API, GoDaddy API, etc

## Navigate Browser to Apache Host/IP from Above
```
http://<apache-host-ip>
```

## Advanced Features and Demos
### Real-time Topology View of Live Kuberentes Cluster
```
kubectl describe svc weavescope-app
```
```
https://<weavescope-host-ip>
```
* Note: You can manually scale Spark Workers through WeaveScope

### Manually Scale Spark Workers
```
kubectl scale --replicas=4 rc spark-worker-2-0-1
```

### `bash` into Live Docker Container
```
kubectl get pod
```
```
kubectl exec <pod-name> -it -- bash -il
```
* Note: You can manually `bash` into live Docker containers through WeaveScope


### Auto-scale Spark Workers based on CPU Utilization
```
kubectl autoscale rc spark-worker-2-0-1 --max=4 --cpu-percent=50
```

### Rolling Update of JupyterHub to Increase `spark.max.cores` and `spark.executor.memory`
```
kubectl rolling-update jupyterhub-master -f jupyterhub-rc-4cores-4gb.yaml
```

### Continuous Deploy, Monitor, and Rollback New Spark ML and TensorFlow AI Models 
```
TODO:  Link to specific jupyter notebook
```

### Continuous, Incremental Training of Spark ML and TensorFlow AI Models from Kafka
```
TODO:  Link to specific jupyter noteook
```

### Highly-scalable, Highly-available Model Serving using Battle-tested NetflixOSS Components
```
http://hystrix.demo.datasticks.com/hystrix-dashboard/monitor/monitor.html?streams=%5B%7B%22name%22%3A%22Circuit%20Breakers%22%2C%22stream%22%3A%22turbine.demo.datasticks.com%2Fturbine.stream%22%2C%22auth%22%3A%22%22%2C%22delay%22%3A%22%22%7D%5D
```

## Support
* Email **help@fluxcapacitor.com** for Support!
