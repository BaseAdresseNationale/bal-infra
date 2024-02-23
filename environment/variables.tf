variable "scaleway_access_key" {
  type      = string
  sensitive = true
}
variable "scaleway_secret_key" {
  type      = string
  sensitive = true
}

variable "environment_name" {
  type = string
}

variable "container_registry" {
  type = string
}
