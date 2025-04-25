kubectl port-forward svc/argocd-server -n argocd 8080:443

kubectl rollout restart deployment argocd-server argocd-repo-server argocd-applicationset-controller argocd-redis argocd-dex-server -n argocd




!!!!!!!!!!!!!!!!!!!!!!!!

Notes

Network issues are preventing apps from standing up in Argo

Trying to setup MetalLB to serve as a proxy. It won't deploy through Argo.


----

Every time I deploy to Git the Private SSH Key is wiped out and I have to recreate the connection in Argo