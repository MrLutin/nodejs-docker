FROM node:latest
LABEL authors="MrLutin"

RUN apt-get update
RUN apt-get install -y git ffmpeg
RUN apt-get clean && rm -rf /var/lib/apt/lists/*


RUN mkdir /App
COPY ./entrypoint.sh /entrypoint.sh


## Add compatibility for Pterodactyle panel
RUN adduser --disabled-login container
USER container
ENV  USER=container HOME=/App

WORKDIR /App
CMD ["/bin/bash", "/entrypoint.sh"]
