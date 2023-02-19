# 移除所有deployment
kubectl get deploy | awk '{print $1}' | xargs kubectl delete deploy
# 移除所有jobs
kubectl get jobs | awk '{print $1}' | xargs kubectl delete jobs
# 移除所有Service
kubectl get services | awk '{print $1}' | xargs kubectl delete services
# 移除ingress: spoved-ingress
kubectl delete ingress spoved-ingress
