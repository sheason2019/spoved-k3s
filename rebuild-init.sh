CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

# 移除旧版本代码
rm -rf ./spoved
# 拉取代码
git clone https://github.com/sheason2019/spoved --depth=1 -b develop ./spoved
# 编译Spoved初始化脚本
nerdctl run --entrypoint sh -v $CURRENT_DIR/spoved:/code --env PRODUCTION=true --env BUILD_TYPE=INITIAL golang:1.20.0-alpine3.17 /code/build.sh
# 构建Spoved镜像
nerdctl build -t root/spoved-init ./spoved
