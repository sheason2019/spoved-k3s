# 构建 Spoved 基础设施

Spoved 使用 K3s 作为基础设施，以实现服务的构建和滚动升级。

# 带环境参数的 Shell 指令

创建一个 shell 文件包含如下内容：

```shell
# build.sh
echo $ARGUMENT
```

执行后的输出如下所示：

```shell
$ ARGUMENT=100 sh build.sh
# output
# 100
```
