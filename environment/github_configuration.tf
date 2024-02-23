# Configuring container IDs in CI
resource "github_actions_environment_secret" "mes_adresses" {
  for_each = {
    "mes-adresses"     = scaleway_container.mes_adresses.id
    "mes-adresses-api" = scaleway_container.mes_adresses_api.id
  }
  repository      = "BaseAdresseNationale/${each.key}"
  environment     = var.environment_name
  secret_name     = "CONTAINER_ID"
  plaintext_value = each.value
}

# Configuring scaleway secrets to use in CI
resource "github_actions_environment_secret" "scaleway_access_key" {
  for_each        = toset(["mes-adresses", "mes-adresses-api"])
  repository      = "BaseAdresseNationale/${each.value}"
  environment     = var.environment_name
  secret_name     = "SCALEWAY_ACCES_KEY"
  plaintext_value = var.scaleway_access_key
}
resource "github_actions_environment_secret" "scaleway_secret_key" {
  for_each        = toset(["mes-adresses", "mes-adresses-api"])
  repository      = "BaseAdresseNationale/${each.value}"
  environment     = var.environment_name
  secret_name     = "SCALEWAY_SECRET_KEY"
  plaintext_value = var.scaleway_secret_key
}
