#!/bin/sh

echo '...Dashboard - Turbine...'
kubectl delete rc turbine
kubectl delete svc turbine

echo '...Dashboard - Weavescope...'
kubectl delete rc weavescope-app
kubectl delete ds weavescope-probe
kubectl delete svc weavescope-app