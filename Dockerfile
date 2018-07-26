FROM centos:centos6

LABEL maintainer="nigelpoulton@hotmail.com"

# Enable EPEL for Node.js
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Node...
RUN yum install -y npm

# Copy app to /src
COPY . /src

RUN npm config set strict-ssl false

# Install app and dependencies into /src
RUN cd /src; npm install

# WORKDIR /src
# RUN npm config set strict-ssl false
# RUN npm install

EXPOSE 8080

CMD cd /src && node ./app.js

# ENTRYPOINT [ "node", "./app,js" ]