resource "scaleway_container" "proxy" {
  namespace_id   = scaleway_container_namespace.namespace.id
  name           = "bal-proxy"
  registry_image = "${var.container_registry}/proxy:latest"
  port           = 80

  lifecycle {
    ignore_changes = [
      registry_image # edited by the deployment CI
    ]
  }
}
