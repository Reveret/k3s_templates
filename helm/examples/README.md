# Game server examples

These values files configure the published `app` chart for dedicated game
servers. Install the chart from the Helm repository:

```bash
helm repo add k3s-templates https://reveret.github.io/k3s_templates
helm repo update
```

For Minecraft Java Edition:

```bash
helm upgrade --install minecraft k3s-templates/app \
  --namespace minecraft --create-namespace \
  --version 0.6.0 \
  -f minecraft-values.yaml
```

For a Terraria server with TShock:

```bash
helm upgrade --install terraria k3s-templates/app \
  --namespace terraria --create-namespace \
  --version 0.6.0 \
  -f terraria-tshock-values.yaml
```

Both examples create persistent storage and a ClusterIP service. Configure
router/firewall forwarding or a suitable external service separately if
players need to connect from outside the cluster. The Minecraft example uses
TCP `25565`; the Terraria example exposes TCP and UDP `7777`.

The Minecraft example accepts the Minecraft EULA by setting `EULA=TRUE`.
Review the EULA before deploying. Pin and test an exact image version for
production rather than relying on a moving image tag.

The TShock example is based on the `trfc/terraria` image documentation and
starts a small world at `/world/Terrarium.wld` if it does not already exist.
That image warns that version upgrades can break compatibility or risk world
data, so back up the persistent world and verify image tags before upgrading.
Do not put a server password in public values; configure it through a private
configuration or secret-management workflow.
