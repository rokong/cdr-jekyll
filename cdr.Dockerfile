FROM codercom/code-server:3.9.1
USER root

# cdr config
COPY cdr-config.yaml /home/coder/.config/code-server/config.yaml

# cdr data
RUN mkdir -p /home/coder/.local/share/code-server \
    && chown -R coder:coder /home/coder/.local/share/code-server

# docker
ARG DOCKERVERSION=20.10.5
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
    && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 -C /usr/bin docker/docker \
    && rm docker-${DOCKERVERSION}.tgz \
    && groupadd docker \
    && usermod -aG docker coder \
    && mkdir -p /home/coder/.docker \
    && chown coder:coder /home/coder/.docker -R \
    && chmod g+rwx /home/coder/.docker -R

# code-server
USER coder
