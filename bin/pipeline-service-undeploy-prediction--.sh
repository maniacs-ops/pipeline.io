echo '...Prediction - PMML...'                                                          
kubectl delete rc prediction-pmml                                                       
kubectl delete svc prediction-pmml
                                                                                        
echo '...Prediction - Codegen...'                                                       
kubectl delete rc prediction-codegen
kubectl delete svc prediction-codegen                                                    
                                                                                        
echo '...Prediction - Cache...'                                                         
kubectl delete rc prediction-cache
kubectl delete svc prediction-cache
 
echo '...Prediction - Tensorflow...'                                                    
kubectl delete rc prediction-tensorflow
kubectl delete svc prediction-tensorflow