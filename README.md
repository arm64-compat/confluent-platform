# Confluent-Kafka ARM64 Compatible Image

[![CircleCI](https://circleci.com/gh/arm64-compat/confluent-platform/tree/main.svg?style=svg)](https://circleci.com/gh/arm64-compat/confluent-platform/tree/main)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

This repository provides `linux/amd64` & `linux/arm64` compatible images for [Confluent Platform](https://www.confluent.io/). These images can be used with [Confluent HELM Charts](https://github.com/confluentinc/cp-helm-charts).

Images are natively built and not using QEMU emulation support thus are faster when used with compatible CPU architecture.

**Note**: images are only for development purposes and has not been tested for production ready use-cases.

As Mac M1 chip processor laptops are becoming increasily popular, running incompatible containers are slower and impacts productive. Enumlated images are resource hungry and doesn't let you leverage the benefits of M1 Chip.

This repo is inspired from blog post [Kafka Docker Images for other CPU architectures
](https://nxt.engineering/blog/kafka-docker-image/).


## Supported Images & Tags

Supported Projects Include:

* [Confluent Zookeeper](https://github.com/arm64-compat/confluent-platform/pkgs/container/confluentinc%2Fcp-zookeeper)
* [Confluent Kafka](https://github.com/orgs/arm64-compat/packages/container/package/confluentinc%2Fcp-kafka)
* [Confluent Kafka-Connect](https://github.com/orgs/arm64-compat/packages/container/package/confluentinc%2Fcp-kafka-connect)
* [Confluent Kafka Rest](https://github.com/arm64-compat/confluent-platform/pkgs/container/confluentinc%2Fcp-kafka-rest)
* [Confluent Schema Registry](https://github.com/orgs/arm64-compat/packages/container/package/confluentinc%2Fcp-schema-registry)
* [Confluent KSQLDB Server](https://github.com/orgs/arm64-compat/packages/container/package/confluentinc%2Fcp-ksqldb-server)

More Images can be found at [GHCR Package Repository](https://github.com/orgs/arm64-compat/packages?repo_name=confluent-platform).

The images come in following variants:

* ARM only manifest - `{CONFLUENT_VERSION}-arm64`
* AMD only manifest - `{CONFLUENT_VERSION}-amd64`
* ARM / AMD manifest - `{CONFLUENT_VERSION}`

### Base Image

This repository is a wrapper over different confluent based repositories. Hence the base image
used is kept same which is `registry.access.redhat.com/ubi8/ubi-minimal`.

## Confluent HELM Charts Usage

In your helm charts you can just change the following properties to start using the packaged images:

from

```yaml
image: confluentinc/cp-zookeeper
imageTag: 7.1.1
```

to

```yaml
image: ghcr.io/arm64-compat/confluentinc/cp-zookeeper
imageTag: 7.1.1
```

Refer to chart documentations for more details - https://github.com/confluentinc/cp-helm-charts/tree/master/charts.

## License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
