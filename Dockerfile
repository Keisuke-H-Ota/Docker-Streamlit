FROM python:3
USER root

# apt-get 設定
RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

# 環境変数設定（言語やタイムゾーンを日本に合わせる）
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

# python 実行環境設定
## python の実行環境をコンテナ上の /root/src に作成する
RUN mkdir -p /root/src
## ローカルホストにある requirements.txt をコンテナ上の /root/src にコピーする
COPY requirements.txt /root/src 
## ワークディレクトリを /root/src に移す
WORKDIR /root/src
## 以後 /root/src で実行される
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8001
CMD ["bash"]
