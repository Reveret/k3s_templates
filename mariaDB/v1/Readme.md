
1. Im `k3s/baase/kustomization.yaml` muss folgendes hinzugefügt werden:
```text
resources:
  - https://github.com/Reveret/k3s_templates.git//mariaDB/v1?ref=main
```

2. Es muss ein Secret im Namespace hinterlegt sein. Das aknn so erzeugt werden (die ***EXAMPLE*** ersetzen):
```bash
kubectl create secret generic secrets \
  --namespace=***NAMESPACE*** \
  --from-literal=MARIADB_DATABASE=***DATABASE_NAME*** \
  --from-literal=MARIADB_USER=***DATABASE_USER*** \
  --from-literal=MARIADB_PASSWORD=***DATABASE_PASSWORD*** \
  --from-literal=MARIADB_ROOT_PASSWORD=***DATABASE_ROOT_PASSWORD***
  ```

3. Es muss ein k3s/overlay/prod/database.yaml angelegt werden mit dem Inhalt (das ***SERVICE_NAME*** ersetzen):
```text
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-database
spec:
  hostPath:
    path: /raid5_4TB/k3s/volumes/***SERVICE_NAME***/database
```

4. In k3s/overlay/prod/kustomization.yaml muss folgendes hinzugefügt werden:
```text
patches:
  - path: database.yaml
```

5. (Optional) In k3s/overlay/prod/kustomization.yaml kann die image-Version gestezt werden:
```text
images:
  - name: mariadb
    newTag: latest
```
