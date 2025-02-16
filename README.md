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


