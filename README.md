# protocのビルド環境の提供

protocのプラグインなどの環境構築をおこなったdocker
gRPCのコードを生成する

**対応言語**
+ go
+ web


## 使用方法

### Goの場合
`docker run --rm -it -v ${PWD}:/ex_dir protoc_cmd  --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative ./hoge/fuga.proto`

### Webの場合
`docker run --rm -it -v ${PWD}:/ex_dir protoc_cmd --js_out=import_style=commonjs,binary:front/src --grpc-web_out=import_style=commonjs,mode=grpcwebtext:front/src ./proto/communicate.proto`


## URLs

[Go install](https://go.dev/dl/)

[Protoc](https://grpc.io/docs/protoc-installation/)
[Protoc Go plugin](https://pkg.go.dev/google.golang.org/protobuf/cmd/protoc-gen-go)
[Protoc Go grpc plugin](https://pkg.go.dev/google.golang.org/grpc/cmd/protoc-gen-go-grpc)

[Protoc web plugin](https://github.com/grpc/grpc-web/)