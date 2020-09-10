Deploy:
    1. Deploy Database(Task_nosub & Taskmanger): 
    #Requirement: config storage.yaml field provisioner to specific your environment(currently Google cloud)
        - kubectl apply -f ./database/config #Create configmap for initialize database
        - kubectl apply -f ./database #Deploy database
    2. Deploy application (Task_nosub & Taskmanger)
    #Requirement: setting aws-configmap.yaml for aws secret
        - kubectl apply -f ./secrets #Access docker image on my Docker hub
        - kubectl apply -f .
Ingress.yaml: Create loadbalancer by url.

#Add new user:
    #User side(John)
    1. Create PKI and CSR:
        openssl genrsa -out john.key 2048
        openssl req -new -key john.key -out john.csr
    #Admin side
    2. Create authen.yaml file(/users/john/john-authen.yaml)
        - request: base64 of CSR file content: cat john.csr | base64 | tr -d "\n"
    3. Using master account to apply authen.yaml file above.
        kubectl apply -f john-authen.yaml
    4. Approve certificate request:
        - kubectl get csr #List csrs
        - kubectl certificate approve john #Approve certitficate
        - kubectl get csr/john -o yaml #Check the certificate
    5. Create role for user:
        - kubectl create role developer --verb=create --verb=get --verb=list --verb=update --verb=delete --resource=pods
        - kubectl create rolebinding developer-binding-john --role=developer --user=john
    6. Get current cluster config:
        - kubectl config view -> server: https://...
    #User side(John)
    6. Add PKI to config:
        - kubectl config set-credentials john --client-key=./users/john/john.key --client-certificate=./users/john/john.crt --embed-certs=true
        - kubectl config set-context john --cluster=kubernetes --user=john
        - kubectl config use-context john
