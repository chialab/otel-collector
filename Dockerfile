###
# Collector builder
###
FROM otel/opentelemetry-collector-builder:latest AS builder

COPY builder-config.yaml /home/ocb/builder-config.yaml
RUN ocb --config=/home/ocb/builder-config.yaml

###
# Certificates
###
FROM alpine:3.21 AS certs

RUN apk --update add ca-certificates

###
# Collector image
###
FROM scratch

ARG USER_UID=10001
USER ${USER_UID}

COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder --chmod=755 /home/ocb/output/otelcol /otelcol
ENTRYPOINT ["/otelcol"]
# `4137` and `4318`: OTLP
# `55678`: OpenCensus
# `55679`: zpages
# `6831`, `14268`, and `14250`: Jaeger
# `9411`: Zipkin
EXPOSE 4317 4318 55678 55679 6831 14268 14250 9411
