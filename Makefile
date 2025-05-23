
.PHONY: db-up
db-up:
	docker compose up -d db

.PHONY: run
run:
	bin/dev