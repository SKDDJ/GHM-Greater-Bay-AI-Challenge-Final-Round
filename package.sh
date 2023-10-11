#!/bin/bash

# 注意修改版本号，不要重复，比如 xiugo:v3
docker built -t xiugo:v2 .
# 为镜像打标签
docker tag xiugo:v2 skddj/xiugo:v7
# 上传到 docker hub
docker push skddj/xiugo:v2
# 保存镜像到本地
docker save xiugo:v2 > xiugo_submit.tar
# 压缩镜像
tar czf project/xiugo_submit.tar.gz xiugo_submit.tar
zip -r project.zip project/