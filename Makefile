.PHONY: bin, image

# Note: has trailing slash
ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

bin:
	docker run -v "$(ROOT_DIR)builder-config.yaml:/home/ocb/builder-config.yaml" -v "$(ROOT_DIR)output:/home/ocb/output" otel/opentelemetry-collector-builder:latest --config=/home/ocb/builder-config.yaml

image:
	docker build -t otel-collector:dev .
