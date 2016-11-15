#!/bin/sh

echo '...Starting Load Test...'
kubectl create -f loadtest.ml/loadtest-rc.yaml
