# Example Umbrella Chart

This chart is the project-specific deploy entrypoint.

## What It Does

It composes these reusable charts through Helm dependencies:

- `frontend` -> `app`
- `backend` -> `app`
- `database` -> `database-with-backup`
- `ingress` -> `ingress-routes`

## Local Render Flow

```bash
helm dependency build
helm template example-stack . -f values.yaml -f values-dev.yaml
helm template example-stack . -f values.yaml -f values-prod.yaml
```

## Real-World Publishing Note

The dependency references currently use local `file://` paths so this example stays self-contained in one repository.

In a real public/private split, replace those dependency repository entries with your published chart repository URL.
