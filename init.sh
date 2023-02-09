# 加载持久卷
k3s kubectl apply -f ./spoved-pvc.yml
# 加载Spoved默认服务
k3s kubectl apply -f ./spoved-deployment.yml