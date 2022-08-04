network:
	docker network create bank-network
postgres:
	docker run --name postgres14 --network bank-network -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:14-alpine
postgreslocal:
	docker run --name postgres14 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:14-alpine
createdb: 
	docker exec -it postgres14 createdb --username=root --owner=root simple_bank
dropdb: 
	docker exec -it postgres14 dropdb simple_bank
migrateupprod:
	migrate -path db/migration -database "postgresql://root:F2Hbj6QoTGUsalIKt2w8@simple-bank.czgswtznj6sl.us-east-2.rds.amazonaws.com:5432/simple_bank" -verbose up
migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up
migrateup1:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up 1
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down
migratedownprod:
	migrate -path db/migration -database "postgresql://root:F2Hbj6QoTGUsalIKt2w8@simple-bank.czgswtznj6sl.us-east-2.rds.amazonaws.com:5432/simple_bank" -verbose down
migratedown1:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down 1
sqlc:
	sqlc generate
test:
	go test -v -cover ./...
server:
	go run main.go
mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/techschool/simplebank/db/sqlc Store
.PHONY: postgres createdb dropdb migrateup migratedown migrateup1 migratedown1 sqlc test server network