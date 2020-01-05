IMAGE:=chck/embulk
EMBULK_VER:=0.9.23

.PHONY: all
all: help

.PHONY: build  ## Build image
build:
	docker build . -t ${IMAGE}:${EMBULK_VER}

.PHONY: push  ## Push image
push:
	docker push $(IMAGE):${EMBULK_VER}

.PHONY: help ## View help
help:
	@grep -E '^.PHONY: [a-zA-Z_-]+.*?## .*$$' $(MAKEFILE_LIST) | sed 's/^.PHONY: //g' | awk 'BEGIN {FS = "## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
