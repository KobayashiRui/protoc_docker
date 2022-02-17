# protocのビルド環境の提供

protocのプラグインなどの環境構築をおこなったdocker
gRPCのコードを生成する

**対応言語**
+ go
+ web

## build
`docker build ./ -t protoc_cmd`

## 使用方法

### /bin/sh
`docker run -it --entrypoint=/bin/sh protoc_cmd`

### Goの場合
`docker run --rm -it -v ${PWD}:/ex_dir protoc_cmd  --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative ./hoge/fuga.proto`

### Web(grpc/grpc-web)の場合
`docker run --rm -it -v ${PWD}:/ex_dir protoc_cmd --js_out=import_style=commonjs,binary:<output dir> --grpc-web_out=import_style=commonjs,mode=grpcwebtext:front/src ./proto/communicate.proto`

### Web(improbable-eng/grpc-web)
`docker run --rm -it -v ${PWD}:/ex_dir protoc_cmd --plugin="protoc-gen-ts=/usr/local/bin/protoc-gen-ts" --js_out="import_style=commonjs,binary:<output dir>" --ts_out="service=grpc-web:<output dir>" ./proto/communicate.proto`

## URLs

[Go install](https://go.dev/dl/)

[Protoc](https://grpc.io/docs/protoc-installation/)
[Protoc Go plugin](https://pkg.go.dev/google.golang.org/protobuf/cmd/protoc-gen-go)
[Protoc Go grpc plugin](https://pkg.go.dev/google.golang.org/grpc/cmd/protoc-gen-go-grpc)

[Protoc web plugin](https://github.com/grpc/grpc-web/)