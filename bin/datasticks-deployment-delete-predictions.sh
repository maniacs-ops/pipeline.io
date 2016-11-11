echo '...Prediction - PMML...'                                                          
kubectl delete rc prediction-pmml                                                       
                                                                                        
echo '...Prediction - Codegen...'                                                       
kubectl delete rc prediction-codegen                                                    
                                                                                        
echo '...Prediction - Cache...'                                                         
kubectl delete rc prediction-cache                                                      
                                                                                        
echo '...Prediction - Tensorflow...'                                                    
kubectl delete rc prediction-tensorflow                                                 
