
##############PROVIDER us-east-2

terraform {
  required_providers {
    aws = ">= 2.0"
  }
}

provider "aws" {
  alias      = "us-east-2"
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "us-east-2"
}


# PROVIDER us-west-2

provider "aws" {
  alias      = "us-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "us-west-2"
}
