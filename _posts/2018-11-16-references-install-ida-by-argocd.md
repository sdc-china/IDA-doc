---
title: "Install IDA and Selenium with ArgoCD + Kustomize + Helm Charts"
category: references
date: 2018-11-16 17:00:00
last_modified_at: 2023-10-26 11:20:00
---

# Install IDA and Selenium with ArgoCD + Kustomize + Helm Charts

## 1. Prerequisites

### 1.1 Enable helm build option in ArgoCD

Patch config map **argocd-cm** of your ArgoCD deployment.

```
kubectl patch configmap/argocd-cm --type merge -p '{"data":{"kustomize.buildOptions":"--enable-helm"}}'
```

More details refer to doc [https://argo-cd.readthedocs.io/en/stable/user-guide/kustomize/#kustomizing-helm-charts](https://argo-cd.readthedocs.io/en/stable/user-guide/kustomize/#kustomizing-helm-charts)

### 1.2 Public helm charts repository

- IDA Helm Charts Repository: [https://sdc-china.github.io/ida-operator](https://sdc-china.github.io/ida-operator)
- Selenium Helm Charts Repository: [https://www.selenium.dev/docker-selenium](https://www.selenium.dev/docker-selenium)

### 1.3 Setup private helm charts repository (Optional)

If the public helm charts repository is not available in your network, then you can setup private helm charts repository.

- The helm charts repository can be hosted by any web server, the layout of the repository looks like this:

```
charts/
  |
  |- index.yaml
  |
  |- idaweb-helm-24.0.7.tgz
  |
  |- selenium-grid-0.28.4.tgz
```

- Download [idaweb-helm-24.0.7.tgz](https://github.com/sdc-china/ida-operator/releases/download/24.0.7/idaweb-helm-24.0.7.tgz), and upload it to your private repository.

- Download [selenium-grid-0.28.4.tgz](https://github.com/SeleniumHQ/docker-selenium/releases/download/selenium-grid-0.28.4/selenium-grid-0.28.4.tgz), and upload it to your private repository.

- Create **index.yaml**, and then upload it to your private repository. Example:

```
apiVersion: v1
entries:
  idaweb-helm:
  - apiVersion: v2
    appVersion: 1.16.0
    created: "2024-09-06T04:01:18.106366179-07:00"
    description: A Helm chart for creating a IDA Web Server in Kubernetes
    digest: 46479ea5108923c0ceff6d5b78e25380f3354951ac1ea67749f05bfdf9e87a8a
    name: idaweb-helm
    type: application
    urls:
    - https://<YOUR_PRIVATE_REPO_HOST>/charts/idaweb-helm-24.0.7.tgz
    version: 24.0.7
  selenium-grid:
  - apiVersion: v2
    appVersion: 4.18.1-20240224
    created: "2024-03-05T06:31:21.030214418Z"
    description: A Helm chart for creating a Selenium Grid Server in Kubernetes
    digest: 5aff9afb7b6e7d90bc9d02f8d242eca7b536f0c849d7c7f8fdf957405484df5f
    icon: https://github.com/SeleniumHQ/docker-selenium/raw/trunk/logo.png
    maintainers:
    - email: selenium-developers@googlegroups.com
      name: SeleniumHQ
    name: selenium-grid
    sources:
    - https://github.com/SeleniumHQ/docker-selenium
    type: application
    urls:
    - https://<YOUR_PRIVATE_REPO_HOST>/charts/selenium-grid-0.28.4.tgz
    version: 0.28.4
generated: "2024-09-06T04:01:17.548051179-07:00"
```

More details please refer to doc [https://helm.sh/docs/topics/chart_repository](https://helm.sh/docs/topics/chart_repository).

**Note:** If self-signed certification is used by the private chart repository, then you will need to customize argocd, more details please refert to [Touble Shooting](#trouble-shooting).

## 2. IDA Installation

### 2.1 Initial IDA Database

Please refer to doc 
[https://sdc-china.github.io/IDA-doc/installation/installation-database-installation-and-configuration.html#install-and-configure-postgresql-db](https://sdc-china.github.io/IDA-doc/installation/installation-database-installation-and-configuration.html#install-and-configure-postgresql-db)

### 2.2 Push IDA docker images to your private docker registry

Please refer to doc [https://github.com/sdc-china/ida-operator?tab=readme-ov-file#before-you-begin](https://github.com/sdc-china/ida-operator?tab=readme-ov-file#before-you-begin)

### 2.3 Create docker registry secret

```
kubectl create secret docker-registry ida-docker-secret --docker-server=<PRIVATE_DOCKER_REGISTRY> --docker-username=<USERNAME> --docker-password=<PASSWORD>
```

### 2.4 Create ida-external-db-credential.yaml for DB secrets

```
apiVersion: v1
kind: Secret
metadata:
  name: "ida-external-db-credential"
stringData:
  DATABASE_USER: "postgres"
  DATABASE_PASSWORD: "password"
```

### 2.5 Create ida-data-pvc.yaml

To enable IDA high availability topology, please use ReadWriteMany accessMode storage.

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: ida-data
spec:
  storageClassName: ida-data
  accessModes:
    - ReadWriteMany
  capacity:
    storage: 50Gi
  nfs:
    path: /<filestore-file-share-name>/ida-data
    server: <filestore-instance-ip>
  persistentVolumeReclaimPolicy: Retain  

---

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: ida-data
spec:
  storageClassName: ida-data
  accessModes:
    - ReadWriteMany
  volumeName: ida-data
  resources:
    requests:
      storage: 50Gi
```

More details about storage access mode, please refer to [https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes)


### 2.6 Create values.yaml for IDA helm charts parameters

```
# IDA chart values
idaDatabase:
  # Database type, the value could be mysql, postgres, db2, oracle
  type: postgres
  internal:
    enabled: false
  external:
    enabled: true
    databaseName: idaweb
    databasePort: 5432
    databaseServerName: localhost
    currentSchema:
    # The secret for database username and password
    databaseCredentialSecret: ida-external-db-credential

operator:
  image: <PRIVATE_DOCKER_REGISTRY>/ida/ida-operator:24.0.7

idaWeb:
  image: <PRIVATE_DOCKER_REGISTRY>/ida/ida:24.0.7
  imagePullPolicy: Always
  imagePullSecrets: <DOCKER_REGISTRY_SECRET>
  replicas: 2
  resources:
    cpuLimit: 4
    cpuRequest: 2
    memoryLimit: 8Gi
    memoryRequest: 4Gi
  storage:
    existingDataPVCName: ida-data
  tlsCert:
  ldapCert:
  serviceType: ClusterIP
```

### 2.7 Create Kustomization.yaml for ArgoCD project

The resources that are not managed by IDA helm charts can be added to the **resources** section.
The customization for existing IDA helm charts resources can be added to the **patches** section.

```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
- ida-external-db-credential.yaml
- ida-data-pvc.yaml

patches:
- path: cloud-sql-proxy.yaml
  target:
    kind: Deployment
    name: idaweb-helm-ida-web

helmCharts:
- name: idaweb-helm
  repo: https://<YOUR_PRIVATE_REPO_HOST>/charts
  version: 24.0.7
  releaseName: idaweb-helm
  namespace: <NAMESPACE>
  valuesFile: values.yaml
```

### 2.8 Example of cloud-sql-proxy.yaml which enable the sidecar container in IDA deployment.

```
- op: "add"
  path: "/spec/template/spec/containers/0"
  value:
    name: cloud-sql-proxy
    image: <CLOUD_SQL_IMAGE>
```

## 3. Selenium Installation

### 3.1 Create values.yaml for IDA helm charts parameters

```
global:
  seleniumGrid:
    imageTag: '4.18.1'
    nodesImageTag: '122.0'

basicAuth:
  enabled: false

ingress:
  enabled: false

edgeNode:
  enabled: true
  service:
    enabled: false
  replicas: 4

chromeNode:
  enabled: true
  service:
    enabled: false
  replicas: 4

firefoxNode:
  enabled: false
  deploymentEnabled: false
  service:
    enabled: false
```

### 3.2 Create Kustomization.yaml for ArgoCD project

```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

helmCharts:
- name: selenium-grid
  repo: https://<YOUR_PRIVATE_REPO_HOST>/charts
  version: 0.28.4
  releaseName: selenium-grid
  namespace: <NAMESPACE>
  valuesFile: values.yaml
```

## 4. Trouble Shooting

### 4.1 Failed to deploy helm chart by private helm charts repository with self-signed certification

The ArgoCD server can't recognize the self-signed certification of private helm charts repository. The workaround is manually add the self-signed certification to argocd deployments.

- Add TLS certification of the private repo by Settings page of ArgoCD UI.
- Patch the following resources.

```
kubectl patch StatefulSet argocd-application-controller --type='json' -p='[{"op": "add", "path": "/spec/template/spec/volumes/0", "value": {"name": "tls-certs-workaround", "configMap": {"name": "argocd-tls-certs-cm", "items": [{"key": "<PRIVATE_REPO_HOST>", "path": "ca-certificates.crt"}]}}}]'

kubectl patch StatefulSet argocd-application-controller --type='json' -p='[{"op": "add", "path": "/spec/template/spec/containers/0/volumeMounts/0", "value": {"mountPath": "/etc/ssl/certs", "name": "tls-certs-workaround"}}]'

kubectl patch Deployment argocd-server --type='json' -p='[{"op": "add", "path": "/spec/template/spec/volumes/0", "value": {"name": "tls-certs-workaround", "configMap": {"name": "argocd-tls-certs-cm", "items": [{"key": "<PRIVATE_REPO_HOST>", "path": "ca-certificates.crt"}]}}}]'

kubectl patch Deployment argocd-server --type='json' -p='[{"op": "add", "path": "/spec/template/spec/containers/0/volumeMounts/0", "value": {"mountPath": "/etc/ssl/certs", "name": "tls-certs-workaround"}}]'

kubectl patch Deployment argocd-repo-server --type='json' -p='[{"op": "add", "path": "/spec/template/spec/volumes/0", "value": {"name": "tls-certs-workaround", "configMap": {"name": "argocd-tls-certs-cm", "items": [{"key": "<PRIVATE_REPO_HOST>", "path": "ca-certificates.crt"}]}}}]'

kubectl patch Deployment argocd-repo-server --type='json' -p='[{"op": "add", "path": "/spec/template/spec/containers/0/volumeMounts/0", "value": {"mountPath": "/etc/ssl/certs", "name": "tls-certs-workaround"}}]'
```

References:
- [https://github.com/argoproj/argo-cd/issues/13154](https://github.com/argoproj/argo-cd/issues/13154)
- [https://github.com/argoproj/argo-cd/issues/6477](https://github.com/argoproj/argo-cd/issues/6477)
