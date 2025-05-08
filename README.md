## Stuff that needs to be automated

### Ansible stuff

* Setup k8s VMs
    * Provision microk8s
    * Join cluster
    * Setup ceph
        * sudo apt install ceph-common
        * sudo scp root@pve1:/etc/pve/ceph.conf /etc/ceph
        * sudo scp root@pve1:/etc/pve/priv/ceph.client.admin.keyring /etc/ceph
        * sudo nano /etc/ceph/ceph.conf # Need to update the paths...

### k8s stuff

* Create the SSH secret?
* kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
* kubectl apply -f clusters/microk8s/argocd.yaml
* kubectl port-forward svc/argocd-server -n argocd 8080:443
    * Add github creds


## Debugging stuff

kubectl rollout restart deployment argocd-server argocd-repo-server argocd-applicationset-controller argocd-redis argocd-dex-server -n argocd

kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl port-forward svc/traefik -n traefik 443:443
