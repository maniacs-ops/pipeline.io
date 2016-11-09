# TODO:  Fix these

echo '...Dashboard - Hystrix...'
kubectl delete rc hystrix
kubectl delete rc turbine

echo '...MySql...'
kubectl delete rc mysql-master

echo '...ZooKeeper...'
kubectl delete rc zookeeper

echo '...Redis...'
kubectl delete rc redis-master

echo '...Spark Master...'
kubectl delete rc spark-master-2-0-1

echo '...Spark Worker...'
kubectl delete rc spark-worker-2-0-1

echo '...Hive Metastore...'
kubectl delete rc metastore-1-2-1

echo '...Zeppelin...'
kubectl delete rc zeppelin-master

echo '...JupyterHub...'
kubectl delete rc jupyterhub-master

echo '...Airflow Scheduler...'
kubectl delete rc airflow

echo '...Presto Master...'
kubectl delete rc presto-master

echo '...Presto Worker...'
kubectl delete rc presto-worker

echo '...Presto AirPal...'
kubectl delete rc airpal

echo '...Kafka...'
kubectl delete rc kafka-0-8

echo '...Dashboard - Weavescope...'
kubectl delete rc weavescope-app
kubectl delete ds weavescope-probe

echo '...Prediction - PMML...'
kubectl delete rc prediction-pmml

echo '...Prediction - Codegen...'
kubectl delete rc prediction-codegen

echo '...Prediction - Cache...'
kubectl delete rc prediction-cache

echo '...Prediction - Tensorflow...'
kubectl delete rc prediction-tensorflow

echo '...Cassandra...'
kubectl delete rc cassandra

echo '...Apache - Home...'
kubectl delete rc home 
