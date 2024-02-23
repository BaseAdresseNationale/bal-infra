# bal-infra

## Setting up Terraform

### Install

This project uses Terraform `1.5.7`.
Get the executable matching your platform on [the official Hashicorp release page](https://releases.hashicorp.com/terraform/1.5.7/).

### First time init

The first time, Terraform needs to run its initialization to fetch providers and setup the state backend.
The value for `$STATE_BACKEND_CONNECTION_STRING` is secret and must be shared in a secure manner across developers.
```
terraform init -backend-config="conn_str=$STATE_BACKEND_CONNECTION_STRING"
```

### Configuring variables

Additionnal secrets need to be configured to access the Scaleway and GitHub APIs.
Fill those values in a `terraform.tfvars` file from the `terraform.tfvars.sample` template.
```
cp terraform.tfvars.sample terraform.tfvars
```
