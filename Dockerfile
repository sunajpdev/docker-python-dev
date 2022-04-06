FROM python:3
USER root

RUN apt-get update
RUN apt-get -y install locales 
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get install -y vim less
RUN apt-get install -y sqlite3

RUN mkdir -p /root/tmp
COPY requirements.txt /root/tmp
WORKDIR /root/tmp

# 初回スクリプト
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade setuptools
RUN python -m pip install -r ./requirements.txt
