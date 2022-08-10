# 1. Get ubuntu
# A) from Official Release
# FROM ubuntu:focal

# B) from Microsoft
ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# 2. Install Packages
RUN apt-get update &&\
    apt-get install -y gnupg

# 3. Register MiKTeX Key Server
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889 

# 4. Download MiKTeX
RUN echo "deb http://linorg.usp.br/CTAN/systems/win32/miktex/setup/deb/ focal universe" | tee /etc/apt/sources.list.d/miktex.list

# 5. Install MiKTeX
RUN apt-get update &&\
    apt-get -y install miktex

# 6. Configure MikTeX
RUN miktexsetup --shared=yes finish &&\
    initexmf --admin --set-config-value [MPM]AutoInstall=1