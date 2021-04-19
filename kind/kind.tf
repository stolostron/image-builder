terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

variable "aws_secret" {
  type = string
}

variable "public_key" {
  type = string
}

resource "random_id" "suffix" {
  byte_length = 3
}

provider "aws" {
  shared_credentials_file = "/etc/${var.aws_secret}/credentials"
  profile = "default"
  region  = "us-east-1"
}

resource "aws_key_pair" "kind" {
  key_name   = "prow-kind-key-${random_id.suffix.hex}"
  public_key = var.public_key
}

data "aws_ami" "kind_image" {
  owners      = ["151448548300"]
  most_recent = true
  filter {
    name   = "name"
    values = ["acm-kind-*"]
  }
}

resource "aws_instance" "kind" {
  ami           = data.aws_ami.kind_image.id
  instance_type = "t2.2xlarge"
  key_name      = aws_key_pair.kind.key_name

  tags = {
    Name = "prow-kind-${random_id.suffix.hex}"
  }
}

output "public_ip" {
  value = aws_instance.kind.public_ip
}
