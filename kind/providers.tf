terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  shared_credentials_file = "/etc/${var.aws_secret}/credentials"
  profile = "default"
  region  = "${var.aws_region}"
}
