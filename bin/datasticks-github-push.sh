#!/bin/sh                                                                               
<<<<<<< HEAD
                                                                                        
eval $(ssh-agent -s)                                                                    
                                                                                        
ssh-add ~/.ssh/github_rsa                                                               
                                                                                        
cd /root/prediction.ml                                                                  
                                                                                        
git remote set-url origin git@github.com:fluxcapacitor/prediction.ml.git                
                                                                                        
git pull                                                                                
                                                                                        
git add pmml/data/census/census.pmml                                                    
git commit -m "updated pmml"                                                            
git push
=======
cd /root/prediction.ml                                                                              
git add census.pmml
git commit -m "updated pmml"
git push 
>>>>>>> e9e331f628b6c69cd26a75f120226d705c685f99
