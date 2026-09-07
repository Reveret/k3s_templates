# Example Project

This folder models a consuming project repository.

The chart dependencies are downloaded from the published Helm repository:

```text
https://reveret.github.io/k3s_templates
```

## Deploy Entry Point

The deploy entrypoint is:

- `deploy/chart`

That folder contains a small umbrella chart which depends on the public charts and only carries project-specific values.

Install or update its dependencies with:

```bash
helm dependency update deploy/chart
```

This regenerates `deploy/chart/Chart.lock` from the published chart
repository. The lock file must be updated whenever dependency versions or
repositories change.

## Example Composition

The example umbrella chart wires together:

- a frontend app
- a backend app
- a MariaDB database with backup cronjob
- one shared ingress with `/` and `/api` routing
