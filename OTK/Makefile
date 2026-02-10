install:
	kubectl apply -f https://github.com/CAAPIM/layer7-operator/releases/download/v1.2.2/bundle.yaml -n otk

mysql:
	helm upgrade --install mysql -f ./database/mysql/mysql-values.yaml oci://registry-1.docker.io/bitnamicharts/mysql -n otk
	kubectl wait --for=condition=ready --timeout=600s pod -l app.kubernetes.io/name=mysql
cert:
	openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 \
	-subj "/C=FR/ST=Ile de France/L=Paris/O=Broadcom/OU=IMS/CN=*.brcmlabs.com" \
    -keyout ./resources/secrets/tls/tls.key  -out ./resources/secrets/tls/tls.crt
list: 
	kubectl get pods -n otk
	kubectl get ingress -n otk
set: install
	kubectl apply -k . -n otk
ssg:
	kubectl apply -f otk-gateway.yaml -n otk
del:
	kubectl delete gateway ssg -n otk
ingresslogs:
	kubectl logs -f ingress-nginx-controller-7df494ddf6-82krb -n ingress-nginx

oplogs:
	kubectl logs -f layer7-operator-controller-manager-7bf59c4c68-qpbvs -n otk