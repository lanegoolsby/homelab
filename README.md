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
        * sudo microk8s connect-external-ceph --ceph-conf /etc/ceph/ceph.conf --keyring /etc/ceph/ceph.client.admin.keyring --rbd-pool k8s-pvc
        * sudo rbd create k8s-pvc/volumes --size 10G
        * sudo rbd map k8s-pvc/volumes
        * echo "/dev/rbd0 /mnt/ceph-storage ext4 noauto,_netdev 0 0" | sudo tee -a /etc/fstab
        * echo "rbd/volumes id=admin,keyring=/etc/ceph/ceph.client.admin.keyring" | sudo tee -a /etc/ceph/rbdmap
        * sudo systemctl enable rbdmap


### k8s stuff

* Create the SSH secret?
* kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
* kubectl apply -f apps/argocd.yaml


## Debugging stuff

kubectl port-forward svc/argocd-server -n argocd 8080:443

kubectl rollout restart deployment argocd-server argocd-repo-server argocd-applicationset-controller argocd-redis argocd-dex-server -n argocd

kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl port-forward svc/traefik -n traefik 443:443
