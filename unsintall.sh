# 移除所有deployment
k3s kubectl get deploy | awk '{print $1}' | xargs k3s kubectl delete deploy
# 移除所有jobs
k3s kubectl get jobs | awk '{print $1}' | xargs k3s kubectl delete jobs
# 移除所有Service
k3s kubectl get services | awk '{print $1}' | xargs k3s kubectl delete services
# 移除ingress: spoved-ingress
k3s kubectl delete ingress spoved-ingress
