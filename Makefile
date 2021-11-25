.PHONY: default help

default: help
help: ## help: display make targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
			awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m make %-20s -> %s\n\033[0m", $$1, $$2}'

# --------------------------------------------------
# Build Targets
# --------------------------------------------------

.PHONY: start
start: ## start the application stack
	@./vendor/bin/sail up -d

.PHONY: stop
stop: ## stop the application stack
	@./vendor/bin/sail stop

# --------------------------------------------------
# Test Targets
# --------------------------------------------------

.PHONY: test
test: ## run the phpunit tests
	@./vendor/bin/sail test