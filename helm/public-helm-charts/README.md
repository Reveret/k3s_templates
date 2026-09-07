# Public Helm Charts

This folder models the reusable public chart repository.

## Charts

- `app`: generic single-workload chart for frontend, backend, gameserver, or similar runtime services
- `database-with-backup`: MariaDB plus persistent storage and a backup cronjob
- `ingress-routes`: shared ingress chart that can route one host to multiple existing services

## Publishing Note

The example umbrella chart in this workspace uses local `file://` dependencies so the structure stays self-contained.

When publishing this repository for real use, the consuming project would normally replace those local dependency references with your public chart repository URL.
