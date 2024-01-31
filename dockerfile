# I used the Ubuntu 22.04 LTS Docker image as the base for this image:
FROM ubuntu:latest

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

ENV TZ=America/Denver
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /home/app


WORKDIR /home/app

COPY scripts/entrypoint.sh /home/app/entrypoint.sh

RUN chmod +x /home/app/entrypoint.sh

