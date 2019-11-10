IMAGE:=chck/embulk
TAG:=0.919

.PHONY: all
all: help

.PHONY: build  ## Build image
build:
	docker build . -t ${IMAGE}:${TAG} -t ${IMAGE}:latest

.PHONY: push  ## Push image
push:
	docker push $(IMAGE):${TAG}
	docker push $(IMAGE):latest

.PHONY: help ## View help
help:
	@grep -E '^.PHONY: [a-zA-Z_-]+.*?## .*$$' $(MAKEFILE_LIST) | sed 's/^.PHONY: //g' | awk 'BEGIN {FS = "## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
