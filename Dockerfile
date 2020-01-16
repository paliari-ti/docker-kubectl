FROM ubuntu:bionic

LABEL maintainer="Daniel Fernando Lourusso <dflourusso@gmail.com>"

# Install required system packages and dependencies
RUN apt update -y && apt install -y curl sudo gettext-base \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && sudo mv ./kubectl /usr/local/bin/kubectl \
    && apt-get purge -y --auto-remove \
    && apt-get clean -y \
    && rm -r /var/lib/apt/lists /var/cache/apt/archives

CMD [ "kubectl",  "--help" ]