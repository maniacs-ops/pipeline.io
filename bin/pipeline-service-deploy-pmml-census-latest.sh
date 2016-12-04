#!/bin/sh

echo '...Prediction - PMML...'
kubectl create -f $PIPELINE_HOME/prediction.ml/pmml-rc.yaml
kubectl create -f $PIPELINE_HOME/prediction.ml/pmml-svc.yaml
kubectl describe svc prediction-pmmlpipeline-cluster-up-aws_k8s_predictions--