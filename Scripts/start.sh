#!/bin/bash

# Restarting the main gateway pod in default namespace
k_pod=$(microk8s kubectl get pods | grep ssg)
ssg_pod="${k_pod%% *}"
microk8s kubectl delete pod ${ssg_pod}
echo "Restarting gateway ssg in default namespace: ${ssg_pod}"
microk8s get pods 

# Restarting the otk pod in otk namespace
k_pod=$(microk8s kubectl get pods -n otk | grep ssg)
otk_pod="${k_pod%% *}"
microk8s kubectl delete pod ${otk_pod} -n otk

echo "Restarting gateway ssg in otk namespace: ${otk_pod}"
microk8s kubectl get pods -n otk
