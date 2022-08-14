module github.com/techschool/simplebank

go 1.15

require (
	github.com/aead/chacha20poly1305 v0.0.0-20170617001512-233f39982aeb
	github.com/dgrijalva/jwt-go v3.2.0+incompatible
	github.com/go-playground/validator/v10 v10.4.1
	github.com/golang/mock v1.6.0
	github.com/lib/pq v1.10.4
	github.com/o1egl/paseto v1.0.0
	github.com/spf13/viper v1.11.0
	github.com/stretchr/testify v1.7.1
	golang.org/x/crypto v0.0.0-20220411220226-7b82a4e95df4
)

require google.golang.org/protobuf v1.28.1

require (
	github.com/gin-gonic/gin v1.7.7
	github.com/golang-migrate/migrate/v4 v4.15.2
	github.com/google/uuid v1.3.0
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.11.2
	github.com/rakyll/statik v0.1.7
	google.golang.org/genproto v0.0.0-20220805133916-01dd62135a58
	google.golang.org/grpc v1.48.0
	google.golang.org/grpc/cmd/protoc-gen-go-grpc v1.1.0
)
