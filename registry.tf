# TODO do we want one registry for all different apps or split them up?
resource "scaleway_registry_namespace" "container_registry" {
  name = "bal"
}
