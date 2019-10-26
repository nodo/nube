.DEFAULT_GOAL = help
.PHONY: help test tidy

help: ## Print help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

test: ## Run all the tests
	prove -Ilib t/**/*

tidy: ## Run perltidy in all the files
	perltidy -b lib/**/*.pm t/Nube/**/*.t bin/* && \
		rm -f lib/**/*.bak t/Nube/**/*.bak bin/*bak
