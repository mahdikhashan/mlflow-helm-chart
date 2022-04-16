# mlflow

A Helm chart for Mlflow open source platform for the machine learning lifecycle

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.24.0](https://img.shields.io/badge/AppVersion-1.24.0-informational?style=flat-square)

## Get Helm Repository Info

```console
helm repo add community-charts https://community-charts.github.io/helm-charts
helm repo update
```

_See [`helm repo`](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Installing the Chart

```console
helm install [RELEASE_NAME] community-charts/mlflow
```

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Requirements

Kubernetes: `>=1.16.0-0`

## Uninstall Helm Chart

```console
helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] community-charts/mlflow
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| artifactRoot.azureBlob.accessKey | string | `""` |  |
| artifactRoot.azureBlob.connectionString | string | `""` |  |
| artifactRoot.azureBlob.container | string | `""` |  |
| artifactRoot.azureBlob.enabled | bool | `false` |  |
| artifactRoot.azureBlob.path | string | `""` |  |
| artifactRoot.azureBlob.storageAccount | string | `""` |  |
| artifactRoot.gcs.bucket | string | `""` |  |
| artifactRoot.gcs.enabled | bool | `false` |  |
| artifactRoot.gcs.path | string | `""` |  |
| artifactRoot.s3.awsAccessKeyId | string | `""` |  |
| artifactRoot.s3.awsSecretAccessKey | string | `""` |  |
| artifactRoot.s3.bucket | string | `""` |  |
| artifactRoot.s3.enabled | bool | `false` |  |
| artifactRoot.s3.path | string | `""` |  |
| backendStore.databaseMigration | bool | `false` |  |
| backendStore.postgres.database | string | `""` |  |
| backendStore.postgres.enabled | bool | `false` |  |
| backendStore.postgres.host | string | `""` |  |
| backendStore.postgres.password | string | `""` |  |
| backendStore.postgres.port | int | `5432` |  |
| backendStore.postgres.user | string | `""` |  |
| extraArgs | object | `{"exposePrometheus":"/mlflow/metrics"}` | A map of arguments and values to pass to the `mlflow server` command Keys must be camelcase. Helm will turn them to kebabcase style. |
| extraEnvVars | object | `{}` |  |
| extraSecretNamesForEnvFrom | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"burakince/mlflow"` |  |
| image.tag | string | `"1.24.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
