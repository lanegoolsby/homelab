* Create the SSH secret?
* kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
* kubectl apply -f clusters/microk8s/argocd.yaml
* kubectl port-forward svc/argocd-server -n argocd 8080:443
    * Add github creds





kubectl rollout restart deployment argocd-server argocd-repo-server argocd-applicationset-controller argocd-redis argocd-dex-server -n argocd

kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl port-forward svc/traefik -n traefik 443:443

!!!!!!!!!!!!!!!!!!!!!!!!

This has the appearance of working