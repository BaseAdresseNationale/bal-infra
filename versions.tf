terraform {
  backend "pg" {}

  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
    github = {
      source = "integrations/github"
    }
  }
  # Keeping latests open source version until we see progress from OpenTofu
  required_version = "~> 1.5.7"
}
