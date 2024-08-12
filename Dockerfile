# 使用官方 Node.js 镜像作为基础镜像
FROM node:18-alpine3.20

# 设置工作目录
WORKDIR /usr/src/app

# 将 package.json 和 package-lock.json 复制到工作目录
COPY  /src/package*.json ./

# 安装应用程序的依赖
RUN npm install

# 将应用程序的源代码复制到工作目录
COPY src/ .

# 公开应用程序的端口
EXPOSE 3000

# 启动应用程序
CMD [ "node", "index.js" ]
