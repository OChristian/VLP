#!/bin/bash

k_pod=$(kubectl get pods | grep ssg)
pod="${k_pod%% *}"
echo "Pod name: ${pod}"