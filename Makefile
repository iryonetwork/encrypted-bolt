GOLANGCI_LINT_VERSION ?= v1.10.2

test: test/unit test/golint ## run all tests

test/unit: ## run all unit tests
	go test -short ./...

test/golint: .bin/lint_$(GOLANGCI_LINT_VERSION)/golangci-lint
	.bin/lint_$(GOLANGCI_LINT_VERSION)/golangci-lint run

.bin/lint_$(GOLANGCI_LINT_VERSION)/golangci-lint:
	wget https://install.goreleaser.com/github.com/golangci/golangci-lint.sh
	chmod +x golangci-lint.sh
	./golangci-lint.sh -b .bin/lint_$(GOLANGCI_LINT_VERSION) $(GOLANGCI_LINT_VERSION)
	rm -f golangci-lint.sh
