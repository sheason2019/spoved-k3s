# 安装使用国内镜像源的 k3s
curl -sfL https://rancher-mirror.rancher.cn/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh -s - --system-default-registry "mirror.ccs.tencentyun.com"
# 加载持久卷
k3s kubectl apply -f ./spoved-pvc.yml
# 加载Spoved默认服务
k3s kubectl apply -f ./spoved-deployment.yml