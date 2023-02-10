K3S_EXIST=$(which k3s)
# k3s 命令为空时安装使用国内镜像源的 k3s
if [ "$K3S_EXIST"z = z ]; then
  curl -sfL https://rancher-mirror.rancher.cn/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh -s - --system-default-registry "mirror.ccs.tencentyun.com"
fi
# 加载Role
k3s kubectl apply -f ./spoved-role.yml
# 加载ServiceAccount
k3s kubectl apply -f ./spoved-service-account.yml
# 绑定Role和ServiceAccount
k3s kubectl apply -f ./spoved-role-binding.yml
# 加载持久卷
k3s kubectl apply -f ./spoved-pvc.yml
# 加载Spoved默认服务
k3s kubectl apply -f ./spoved-deployment.yml