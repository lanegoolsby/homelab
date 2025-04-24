kubectl port-forward svc/argocd-server -n argocd 8080:443

kubectl rollout restart deployment argocd-server argocd-repo-server argocd-applicationset-controller argocd-redis argocd-dex-server -n argocd