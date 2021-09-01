#FROM ubuntu:20.04
FROM ubuntu:bionic

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Update stuff
RUN apt-get update --fix-missing
RUN apt-get install -y build-essential libssl-dev checkinstall \
    curl wget git gnupg nano vim htop openssh-server -y

RUN apt-get install -y pkg-config libcairo2-dev 

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 15.0.0

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

RUN echo root:root | chpasswd

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# install global node stuff
RUN npm install -g ts-node yarn nodemon

# install python3.8
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:deadsnakes/ppa -y
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install python3.9 -y
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-pip
RUN DEBIAN_FRONTEND=noninteractive pip3 install virtualenv
RUN echo 'alias python=python3.9' >> ~/.bashrc

# set up persisted workspace
RUN mkdir /workspace
WORKDIR /workspace

VOLUME /workspace-dev


RUN mkdir /root/.ssh
# COPY ./sshd_config /etc/ssh/sshd_config
# COPY ./id_ed25519 /root/.ssh
# COPY ./id_ed25519.pub /root/.ssh
# COPY ./authorized_keys /root/.ssh

RUN mkdir /runcontainer
COPY ./headless.sh /runcontainer

# JUPYTERLAB
RUN virtualenv /workspace/venv 


CMD ["bash", "/runcontainer/headless.sh"]

