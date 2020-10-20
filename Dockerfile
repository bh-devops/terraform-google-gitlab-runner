FROM php:7.3.23-alpine
############### INSTALL DEPENDENCIES ###############
RUN apk update && apk upgrade && \
    apk add nginx git openssh composer curl python3 which bash php7-soap php7-gmp libxml2-dev gmp-dev nodejs npm && \
    docker-php-ext-install soap && \
    docker-php-ext-install gmp && \
    ln -s /usr/bin/python3 /usr/bin/python    

################ INSTALL HELM ######################
RUN curl -fsSL -o helm-v3.3.4-linux-amd64.tar.gz https://get.helm.sh/helm-v3.3.4-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.3.4-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm

################ INSTALL KUBECTL ###################
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    mkdir -p ~/.kube && \
    git clone https://bitbucket.org/kingmuffin/kingmuffin-scripts.git
#Clone helm template

############### INSTALL GCLOUD SDK #################
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin

############### INSTALL DOCKER #####################
RUN apk add --update docker openrc && \
    rc-update add docker boot

CMD ["/bin/sh"]
