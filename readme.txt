Deploy:
    1. Deploy Database(Task_nosub & Taskmanger): 
    #Requirement: config storage.yaml field provisioner to specific your environment(currently Google cloud)
        - kubectl deploy -f ./database/config #Create configmap for initialize database
        - kubectl deploy -f ./database #Deploy database
    2. Deploy application (Task_nosub & Taskmanger)
    #Requirement: setting aws-configmap.yaml for aws secret
        - kubectl deploy -f ./secrets #Access docker image on my Docker hub
        - kubectl deploy -f .
Ingress.yaml: Create loadbalancer by url.

