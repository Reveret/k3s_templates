# Helm Architecture Example

This folder demonstrates a reusable Helm-based setup for ArgoCD-friendly deployments.

## Structure

- `public-helm-charts`: reusable charts that would normally live in a public chart repository
- `example-project`: a project repository example with one umbrella chart as the deploy entrypoint

## Intended Real-World Split

In a real setup these would usually be separate Git repositories:

1. one public chart repository
2. one or more application repositories consuming those charts

They are colocated here only to make the structure easy to inspect.
