echo '...Master...'
kubectl create -f ../clustered.ml/tensorflow-master-rc.yaml
kubectl create -f ../clustered.ml/tensorflow-master-svc.yaml

echo '...PS0...'
kubectl create -f ../clustered.ml/tensorflow-ps0-rc.yaml
kubectl create -f ../clustered.ml/tensorflow-ps0-svc.yaml

echo '...PS1...'
kubectl create -f ../clustered.ml/tensorflow-ps1-rc.yaml
kubectl create -f ../clustered.ml/tensorflow-ps1-svc.yaml

echo '...Worker0...'
kubectl create -f ../clustered.ml/tensorflow-worker0-rc.yaml
kubectl create -f ../clustered.ml/tensorflow-worker0-svc.yaml

echo '...Worker1...'
kubectl create -f ../clustered.ml/tensorflow-worker1-rc.yaml
kubectl create -f ../clustered.ml/tensorflow-worker1-svc.yaml
