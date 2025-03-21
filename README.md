# OpenTelemetry collector

Custom build of OpenTelemetry collector, to be used in a Kubernetes cluster in AWS. Build using [OpenTelemetry Collector Builder](https://github.com/open-telemetry/opentelemetry-collector/tree/main/cmd/builder).

Includes the following modules:

| Providers                                                                                                          | Extensions                                                                                                                         | Receivers                                                                                                                      | Processors                                                                                                                      | Exporters                                                                                                                                           |
|--------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| [envprovider](https://github.com/open-telemetry/opentelemetry-collector/tree/main/confmap/provider/envprovider)    | [healthcheckextension](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/extension/healthcheckextension) | [otlpreceiver](https://github.com/open-telemetry/opentelemetry-collector/tree/main/receiver/otlpreceiver)                      | [batchprocessor](https://github.com/open-telemetry/opentelemetry-collector/tree/main/processor/batchprocessor)                  | [otlphttpexporter](https://github.com/open-telemetry/opentelemetry-collector/tree/main/exporter/otlphttpexporter)                                   |
| [fileprovider](https://github.com/open-telemetry/opentelemetry-collector/tree/main/confmap/provider/fileprovider)  | [sigv4authextension](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/extension/sigv4authextension)     | [prometheusreceiver](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/receiver/prometheusreceiver)  | [memorylimiterprocessor](https://github.com/open-telemetry/opentelemetry-collector/tree/main/processor/memorylimiterprocessor)  | [prometheusremotewriteexporter](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/exporter/prometheusremotewriteexporter) |

## Usage

Entrypoint is the collector binary, passing a configuration file as command when running this is required (see [configuration](https://opentelemetry.io/docs/collector/configuration/)):
```
docker run --rm -it -v "$PWD/my-config.yml:/my-config.yml" ghcr.io/chialab/otel-collector:latest --config=/my-config.yml
```
