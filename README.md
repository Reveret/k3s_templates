# k3s_templates

Öffentliche Kubernetes- und Helm-Vorlagen für k3s. Das Repository enthält
wiederverwendbare Helm-Charts sowie beispielhafte Kubernetes-Manifeste und
Deployments.

## Helm-Repository

Die versionierten Helm-Charts werden über GitHub Pages veröffentlicht und sind
unter folgender URL abrufbar:

**https://reveret.github.io/k3s_templates**

Helm kann das Repository direkt einbinden:

```bash
helm repo add k3s-templates https://reveret.github.io/k3s_templates
helm repo update
helm search repo k3s-templates
```

Zum Beispiel lassen sich die Standardwerte eines Charts anzeigen:

```bash
helm show values k3s-templates/app
```

Die Helm-URL ist ein Chart-Repository (mit Index und versionierten Chart-Paketen),
keine Webseite mit einer Liste einzelner YAML-Dateien. Die Quelldateien der
Charts sind im öffentlichen GitHub-Repository einsehbar.

## Veröffentlichte Charts

| Chart | Beschreibung | Aktuelle Version |
| --- | --- | --- |
| [`app`](helm/public-helm-charts/charts/app) | Allgemeines Chart für einen Workload, optional mit Service, Ingress, persistentem Speicher, Startargumenten und mehreren Service-Ports | `0.6.0` |
| [`database-with-backup`](helm/public-helm-charts/charts/database-with-backup) | MariaDB mit persistentem Speicher und Backup-Cronjob | `0.1.0` |
| [`ingress-routes`](helm/public-helm-charts/charts/ingress-routes) | Gemeinsames Ingress-Routing zu bestehenden Services | `0.1.0` |

Die Charts sind außerdem als [GitHub Releases](https://github.com/Reveret/k3s_templates/releases)
verfügbar. Bei Änderungen an den veröffentlichten Charts erstellt der
GitHub-Actions-Workflow Releases und aktualisiert das Helm-Repository.

## Repository-Inhalt

- [`helm/public-helm-charts`](helm/public-helm-charts): veröffentlichte, wiederverwendbare Helm-Charts
- [`helm/examples`](helm/examples/README.md): Beispielwerte für Minecraft Java und Terraria mit TShock
- [`helm/example-project`](helm/example-project): Beispiel für ein Projekt, das die veröffentlichten Charts als Abhängigkeiten nutzt
- [`mariaDB`](mariaDB): MariaDB-Kubernetes-Manifeste in mehreren Varianten

Die Beispiele und Manifeste im Repository werden nicht automatisch durch die
Helm-Repository-URL installiert. Die URL veröffentlicht ausschließlich die
Charts aus `helm/public-helm-charts/charts`.

## Sicherheit

Dieses Repository ist öffentlich. Zugangsdaten, Kubernetes-Secrets,
produktive Werte, interne Domains und andere vertrauliche Konfigurationen
gehören nicht hierher. Hinterlege sie stattdessen im jeweiligen privaten
Deployment-Repository oder in einem Secret-Manager.
