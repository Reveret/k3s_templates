# Public Helm Charts

This folder contains the reusable Helm charts published by this repository.

## Charts

- `app`: generic single-workload chart for frontend, backend, gameserver, or similar runtime services
- `database-with-backup`: MariaDB plus persistent storage and a backup cronjob
- `ingress-routes`: shared ingress chart that can route one host to multiple existing services

## Published repository

The charts are published automatically to GitHub Pages:

```text
https://reveret.github.io/k3s_templates
```

The workflow packages only the charts in this directory. The private example
project is not included. Each chart version is published as a separate GitHub
Release and remains available in the Helm repository.

A consuming repository can reference the charts with:

```yaml
dependencies:
  - name: app
    version: 0.1.0
    repository: https://reveret.github.io/k3s_templates
```

After changing the dependency, run `helm dependency update` in the consuming
chart repository. The generated `Chart.lock` belongs in that consuming
repository and should not be copied from the example project.

## Versioning and GitHub setup

Increase the `version` field in the chart's `Chart.yaml` for every release:

```yaml
version: 0.2.0
```

The chart-releaser workflow creates the corresponding GitHub Release, keeps
older chart packages, and updates the `gh-pages` branch. In the repository
settings, set **Pages → Build and deployment → Source** to **Deploy from a
branch**, select `gh-pages`, and select the `/ (root)` folder.

The chart repository contains templates and safe defaults only. Production
values, domains, storage details, image credentials, and Kubernetes Secrets
must remain in the consuming private repository or a secret manager.

## Fixed local storage

The `app` chart can optionally create a static local `PersistentVolume` and
bind its PVC to a host path on a specific Kubernetes node:

```yaml
persistence:
  enabled: true
  size: 40Gi
  local:
    enabled: true
    path: /raid5_4TB/k3s/volumes/fvtt
    nodeName: k3s-server
```

The path must exist on that node. Local volumes are node-bound; they do not
move automatically if the node becomes unavailable. The chart uses
`persistentVolumeReclaimPolicy: Retain` to avoid deleting the data when the
claim is removed.
