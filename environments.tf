module "dev" {
  source              = "./environment"
  environment_name    = "dev"
  container_registry  = scaleway_registry_namespace.container_registry.endpoint
  scaleway_access_key = var.scaleway_access_key
  scaleway_secret_key = var.scaleway_secret_key
}
