#!/bin/sh                                                                               
                                                                                        
kubectl scale --replicas=2 rc prediction-pmml
kubectl scale --replicas=2 rc prediction-codegen
#kubectl scale --replicas=5 rc prediction-cache 
#kubectl scale --replicas=5 rc prediction-tensorflow                                           
