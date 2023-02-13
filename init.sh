CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
# 替换 crictl 源
mkdir -p /etc/rancher/k3s/
cp configs/registries.yaml /etc/rancher/k3s/

# k3s 命令为空时安装使用国内镜像源的 k3s
K3S_EXIST=$(which k3s)
if [ "$K3S_EXIST"z = z ]; then
  curl -sfL https://rancher-mirror.oss-cn-beijing.aliyuncs.com/k3s/k3s-install.sh | \
  INSTALL_K3S_MIRROR=cn sh -s - \
  --system-default-registry "registry.cn-hangzhou.aliyuncs.com"
fi

# 安装 NerdCtl
wget "https://github.com/containerd/nerdctl/releases/download/v1.2.0/nerdctl-full-1.2.0-linux-amd64.tar.gz"
tar -zxvf nerdctl-full-1.2.0-linux-amd64.tar.gz -C /usr/local
rm "nerdctl-full-1.2.0-linux-amd64.tar.gz"

apt install iptables -y
nft flush ruleset

# 将NerdCtl配置为k3s服务
mkdir -p /etc/nerdctl
cp configs/nerdctl.toml /etc/nerdctl/nerdctl.toml

# 拉取Spoved源码
git clone https://github.com/sheason2019/spoved --depth=1 ./spoved
# 编译Spoved
nerdctl run --entrypoint sh -v $CURRENT_DIR/spoved:/code golang:1.20.0-alpine3.17 /code/build.sh
# 启动buildkitd守护进程
buildkitd &
# 构建Spoved镜像
nerdctl build -t sheason/spoved ./spoved

# # 加载Role
# k3s kubectl apply -f ./spoved-role.yml
# # 加载ServiceAccount
# k3s kubectl apply -f ./spoved-service-account.yml
# # 绑定Role和ServiceAccount
# k3s kubectl apply -f ./spoved-role-binding.yml
# # 加载持久卷
# k3s kubectl apply -f ./spoved-pvc.yml
# # 加载Spoved默认服务
# k3s kubectl apply -f ./spoved-deployment.yml