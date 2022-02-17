FROM --platform=linux/x86_64 debian:buster-slim
RUN apt update
RUN apt install -y protobuf-compiler
RUN apt install -y wget
RUN wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz

#install Go
RUN tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz
RUN rm go1.17.6.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin

#install protoc go plugin
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
# set path 
#ENV PATH $PATH:$(go env GOPATH)/bin
ENV PATH $PATH:/root/go/bin

#install protoc-web plugin
RUN wget https://github.com/grpc/grpc-web/releases/download/1.3.1/protoc-gen-grpc-web-1.3.1-linux-x86_64

RUN mv protoc-gen-grpc-web-1.3.1-linux-x86_64 /usr/local/bin/protoc-gen-grpc-web
RUN chmod +x /usr/local/bin/protoc-gen-grpc-web

#install node js
RUN apt install -y nodejs npm

#n のインストール
RUN npm install -g n

#LTSのインストール
RUN n lts

#hashの更新
RUN hash -r

#old version nodeのアンインストール
RUN apt purge -y nodejs npm

RUN apt -y autoremove

RUN npm install -g ts-protoc-gen


# ボリュームのマウントポイントを定義
RUN mkdir /ex_dir

# マウントしたディレクトリへ移動
WORKDIR /ex_dir

#protocの実行
ENTRYPOINT ["protoc"]