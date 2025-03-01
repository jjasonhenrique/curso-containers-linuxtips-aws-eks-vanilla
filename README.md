# curso-containers-linuxtips-aws-eks-vanilla
Repositorio minimo do EKS

### Conectar em cluster EKS via kubectl
aws eks update-kubeconfig --region us-east-1 --name cluster-vanilla


### Remove namespace terminating

 kubectl get namespace "**namespace**" -o json \
  | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" \
  | kubectl replace --raw /api/v1/namespaces/**namespace**/finalize -f -


### Curl with Host

curl k8s-chip-chipingr-87f13d5df5-1982577811.us-east-1.elb.amazonaws.com -H "Host: chip.jjasonhenrique.com"

### Curl with nginx

curl --location --request POST 'cluster-vanilla-e25253e0235deb3f.elb.us-east-1.amazonaws.com/calculator'  \
--header 'Content-Type: application/json' \
--header 'Host: health.jjasonhenrique.com' \
--data-raw '{
   "age": 39,
   "weight": 75.0,
   "height": 1.75,
   "gender": "M",
   "activity_intensity": "very_active"
} ' --silent | jq .


