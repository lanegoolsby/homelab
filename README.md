## Stuff that needs to be automated

### Ansible stuff

* Setup k8s VMs
    * Setup ceph
        * sudo apt install ceph-common
        * sudo scp root@pve1:/etc/pve/ceph.conf /etc/ceph
        * sudo scp root@pve1:/etc/pve/priv/ceph.client.admin.keyring /etc/ceph
        * sudo nano /etc/ceph/ceph.conf # Need to update the paths...
        * sudo ceph osd pool create microk8s-rbd 128 128
        * sudo ceph osd pool application enable microk8s-rbd rbd
    * Join cluster
    * Provision microk8s
        * sudo microk8s enable dns
        * sudo microk8s enable rook-ceph
        * sudo microk8s connect-external-ceph --ceph-conf /etc/ceph/ceph.conf --keyring /etc/ceph/ceph.client.admin.keyring --rbd-pool k8s-pvc
            * kubectl --namespace rook-ceph-external get cephcluster

### k8s stuff

* Apply ArgoCD CRDs
* Setup microk8s cluster to use ceph for persistent volume claims
* Deploy ArgoCD
* Verify apps can provision PVCs

<!-- * Create the SSH secret?
* kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
* kubectl apply -f apps/argocd.yaml -->


## Debugging stuff

kubectl port-forward svc/argocd-server -n argocd 8080:443

kubectl rollout restart deployment argocd-server argocd-repo-server argocd-applicationset-controller argocd-redis argocd-dex-server -n argocd

kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl port-forward svc/traefik -n traefik 443:443
