# Set the Terraform version
terraform {
  required_version = ">= 0.12"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 2.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.7.0"
    }
  }
}

# Configure the local provider
provider "local" {
  alias = "new_local"
}

# Configure the random provider
provider "random" {}

# Configure the time provider
provider "time" {}


