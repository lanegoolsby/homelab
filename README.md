## Stuff that needs to be automated

### Ansible stuff

* Setup k8s VMs
    * sudo snap install microceph
      * On all nodes
    * sudo microceph cluster bootstrap
      * Follow on screen instructions
    * sudo microceph add [node]
      * Rinse and repeat
    * sudo ceph status
    * sudo microceph disk add /dev/sdb --wipe
      * On all nodes
    * sudo microk8s enable metallb

### k8s stuff

 Deploy ArgoCD
  ```bash
  # Install ArgoCD
  kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  
  # Apply your ArgoCD config
  kubectl apply -f apps/argocd.yml
  
  # Get the initial admin password
  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
  ```

## Debugging stuff

kubectl port-forward svc/argocd-server -n argocd 8080:443

kubectl rollout restart deployment argocd-server argocd-repo-server argocd-applicationset-controller argocd-redis argocd-dex-server -n argocd

kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl port-forward svc/traefik -n traefik 443:443
