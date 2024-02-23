# Container namespace for the environment
# Allows configuring environment variables across all containers at once

resource "scaleway_container_namespace" "namespace" {
  name = "bal-${var.environment_name}"
  environment_variables = {
    "DEPLOYMENT_ENVIRONMENT" = var.environment_name
  }
}
