#!/bin/sh

echo '...Dashboard - Weavescope...'
kubectl create -f ../dashboard.ml/weavescope/weavescope.yaml
kubectl describe svc weavescope-app

echo '...Dashboard - Turbine...'
kubectl create -f ../dashboard.ml/turbine-rc.yaml
kubectl create -f ../dashboard.ml/turbine-svc.yaml
kubectl describe svc turbine

echo '...Prediction - PMML...'
kubectl create -f ../prediction.ml/pmml-rc.yaml
kubectl create -f ../prediction.ml/pmml-svc.yaml
kubectl describe svc prediction-pmml

echo '...Prediction - Codegen...'                                                       
kubectl create -f ../prediction.ml/codegen-rc.yaml                                      
kubectl create -f ../prediction.ml/codegen-svc.yaml
kubectl describe svc prediction-codegen                                                  
                                                                                        
#echo '...Prediction - Tensorflow...'                                                    
#kubectl create -f ../prediction.ml/tensorflow-rc.yaml                                   
#kubectl create -f ../prediction.ml/tensorflow-svc.yaml
#kubectl describe svc prediction-tensorflow                                                  
                                                                                        
#echo '...Prediction - Cache...'
#kubectl create -f ../prediction.ml/cache-rc.yaml                                        
#kubectl create -f ../prediction.ml/cache-svc.yaml
#kubectl describe svc prediction-cache                                                  
