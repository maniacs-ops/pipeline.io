#!/bin/sh

echo '...Dashboard - Weavescope...'
kubectl create -f $PIPELINE_HOME/dashboard.ml/weavescope/weavescope.yaml
kubectl describe svc weavescope-app

echo '...Dashboard - Turbine...'
kubectl create -f $PIPELINE_HOME/dashboard.ml/turbine-rc.yaml
kubectl create -f $PIPELINE_HOME/dashboard.ml/turbine-svc.yaml
kubectl describe svc turbine

echo '...Dashboard - Hystrix...'
kubectl create -f $PIPELINE_HOME/dashboard.ml/hystrix-rc.yaml
kubectl create -f $PIPELINE_HOME/dashboard.ml/hystrix-svc.yaml