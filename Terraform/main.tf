terraform {
  required_version = ">= 0.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

provider "aws" {
  region     = "eu-south-2"
  access_key = "AKIA4W45YFE6XJL7DEWU"
  secret_key = "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"
}
