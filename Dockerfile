FROM python:3.6-alpine3.11

LABEL maintainer="wudong@eastwu.cn"

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories \
	&& apk --update add --no-cache tzdata \
	&& rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& apk add --no-cache g++ \
	&& pip install --no-cache-dir numpy==1.18.1 -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com \
	&& pip install --no-cache-dir pandas==1.0.1 -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com \
