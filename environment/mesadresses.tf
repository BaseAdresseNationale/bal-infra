# Creating a database and a setting up users and permissions

resource "random_password" "database_mes_adresses_user" {
  length = 32
}
resource "scaleway_documentdb_user" "mes_adresses" {
  instance_id = scaleway_documentdb_instance.database.id
  name        = "mes-adresses"
  password    = random_password.database_mes_adresses_user.result
}
resource "scaleway_documentdb_database" "mes_adresses" {
  instance_id = scaleway_documentdb_instance.database.id
  name        = "mes-adresses"
}
resource "scaleway_documentdb_privilege" "mes_adresses" {
  instance_id   = scaleway_documentdb_instance.database.id
  user_name     = scaleway_documentdb_user.mes_adresses.name
  database_name = scaleway_documentdb_database.mes_adresses.name
  permission    = "all"
}

# Configuring containers

resource "scaleway_container" "mes_adresses" {
  namespace_id   = scaleway_container_namespace.namespace.id
  name           = "bal-mes-adresses"
  registry_image = "${var.container_registry}/mes-adresses:latest"

  lifecycle {
    ignore_changes = [
      registry_image # edited by the deployment CI
    ]
  }
}

resource "scaleway_container" "mes_adresses_api" {
  namespace_id   = scaleway_container_namespace.namespace.id
  name           = "bal-mes-adresses-api"
  registry_image = "${var.container_registry}/mes-adresses-api:latest"

  lifecycle {
    ignore_changes = [
      registry_image # edited by the deployment CI
    ]
  }
}
