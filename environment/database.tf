# Creating database instance

resource "random_password" "database_default_user" {
  length  = 32
  special = true
}

resource "scaleway_documentdb_instance" "database" {
  engine            = "FerretDB-1"
  node_type         = "docdb-pro2-xs"
  name              = "bal-${var.environment_name}"
  is_ha_cluster     = true
  volume_size_in_gb = 30
  user_name         = "default"
  password          = random_password.database_default_user.result
}
