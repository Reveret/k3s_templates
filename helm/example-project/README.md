# Example Project

This folder models a consuming project repository.

## Deploy Entry Point

The deploy entrypoint is:

- `deploy/chart`

That folder contains a small umbrella chart which depends on the public charts and only carries project-specific values.

## Example Composition

The example umbrella chart wires together:

- a frontend app
- a backend app
- a MariaDB database with backup cronjob
- one shared ingress with `/` and `/api` routing
