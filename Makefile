.PHONY: migrate migrate_down migrate_up migrate_version compose_debug compose_hot__reload compose_prod

force:
	migrate -database postgres://postgres:postgres@localhost:5432/ec-news--shop?sslmode=disable -path migrations force 1

version:
	migrate -database postgres://postgres:postgres@localhost:5432/ec-news--shop?sslmode=disable -path migrations version

migrate_up:
	migrate -database postgres://postgres:postgres@localhost:5432/ec-news--shop?sslmode=disable -path migrations up 1

migrate_down:
	migrate -database postgres://postgres:postgres@localhost:5432/ec-news--shop?sslmode=disable -path migrations down 1

compose_hot__reload:
	docker-compose -f docker-compose.hot-reload.yml up --build

compose_debug:
	docker-compose -f docker-compose.debug.yml up --build

compose_prod:
	docker-compose -f docker-compose.prod.yml up --build