# mlflow

A Helm chart for Mlflow open source platform for the machine learning lifecycle

![Version: 0.0.4](https://img.shields.io/badge/Version-0.0.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.25.1](https://img.shields.io/badge/AppVersion-1.25.1-informational?style=flat-square)

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

> **Tip**: Search all available chart versions using `helm search repo community-charts -l`. Please don't forget to run `helm repo update` before the command.

## Values Files Examples

## Database Migration Values Files Example

Currently database migration only supporting for Postgres DB backend.

```yaml
backendStore:
  databaseMigration: true
```

## AWS Installation Examples

You can use 2 different way to connect your S3 backend.

- First way, you can access to your S3 with IAM user's awsAccessKeyId and awsSecretAccessKey.
- Second way, you can create an aws role for your service account. And you can assign your role ARN from serviceAccount annotation. You don't need to create or manage IAM user anymore. Please find more information from [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_oidc.html).

> **Tip**: Please follow [this tutorial](https://aws.amazon.com/getting-started/hands-on/create-connect-postgresql-db/) to create your own RDS postgres cluster.

## S3 Access with awsAccessKeyId and awsSecretAccessKey Values Files Example

```yaml
backendStore:
  postgres:
    enabled: true
    host: "postgresql-instance1.cg034hpkmmjt.eu-central-1.rds.amazonaws.com"
    port: 5432
    database: "mlflow"
    user: "mlflowuser"
    password: "Pa33w0rd!"

artifactRoot:
  s3:
    enabled: true
    bucket: "my-mlflow-artifact-root-backend"
    awsAccessKeyId: "a1b2c3d4"
    awsSecretAccessKey: "a1b2c3d4"
```

## S3 Access with AWS EKS Role ARN Values Files Example

> **Tip**: [Associate an IAM role to a service account](https://docs.aws.amazon.com/eks/latest/userguide/specify-service-account-role.html)

```yaml
serviceAccount:
  create: true
  annotations:
    eks.amazonaws.com/role-arn: "arn:aws:iam::account-id:role/iam-role-name"
  name: "mlflow"

backendStore:
  postgres:
    enabled: true
    host: "postgresql-instance1.cg034hpkmmjt.eu-central-1.rds.amazonaws.com"
    port: 5432
    database: "mlflow"
    user: "mlflowuser"
    password: "Pa33w0rd!"

artifactRoot:
  s3:
    enabled: true
    bucket: "my-mlflow-artifact-root-backend"
```

## Azure Cloud Installation Example

> **Tip**: Please follow [this tutorial](https://docs.microsoft.com/en-us/azure/postgresql/tutorial-design-database-using-azure-portal) to create your own postgres database.
> **Tip**: Please follow [this tutorial](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction) to create your azure blob storage and container.

```yaml
backendStore:
  postgres:
    enabled: true
    host: "mydemoserver.postgres.database.azure.com"
    port: 5432
    database: "mlflow"
    user: "mlflowuser"
    password: "Pa33w0rd!"

artifactRoot:
  azureBlob:
    enabled: true
    container: "mlflow"
    storageAccount: "mystorageaccount"
    accessKey: "Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw=="
```

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
| image.tag | string | `"1.25.1"` |  |
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

## Source Code

* <https://github.com/community-charts/helm-charts>
* <https://github.com/burakince/mlflow>
* <https://github.com/mlflow/mlflow>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Burak Ince | <burak.ince@linux.org.tr> |  |
