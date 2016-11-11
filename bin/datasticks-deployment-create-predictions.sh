#!/bin/sh                                                                               


echo '...Prediction - PMML...'                                                       
kubectl create -f ../prediction.ml/pmml-rc.yaml
kubectl create -f ../prediction.ml/pmml-svc.yaml
kubectl describe svc prediction-pmml -w

echo '...Prediction - Codegen...'                                                       
kubectl create -f ../prediction.ml/codegen-rc.yaml                                      
kubectl create -f ../prediction.ml/codegen-svc.yaml
kubectl describe svc prediction-codegen -w                                                 
                                                                                        
echo '...Prediction - Tensorflow...'                                                    
kubectl create -f ../prediction.ml/tensorflow-rc.yaml                                   
kubectl create -f ../prediction.ml/tensorflow-svc.yaml
kubectl describe svc prediction-tensorflow -w                                                 
                                                                                        
echo '...Prediction - Cache...'
kubectl create -f ../prediction.ml/cache-rc.yaml                                        
kubectl create -f ../prediction.ml/cache-svc.yaml
kubectl describe svc prediction-cache -w                                                 
