# curso-containers-linuxtips-aws-eks-vanilla
Repositorio minimo do EKS

### Conectar em cluster EKS via kubectl
aws eks update-kubeconfig --region us-east-1 --name cluster-vanilla


### Teste Curl Health-API

curl --location --request POST 'cluster-vanilla-185832c275b68735.elb.us-east-1.amazonaws.com/calculator'  \
--header 'Content-Type: application/json' \
--header 'Host: health.jjasonhenrique.com' \
--data-raw '{
   "age": 39,
   "weight": 75.0,
   "height": 1.75,
   "gender": "M",
   "activity_intensity": "very_active"
} ' --silent | jq .
