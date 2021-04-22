# Required variables
variable "aws_secret" {
  type = string
}

# Optional variables
variable "aws_instance_type" {
  type = string
  default = "t3.xlarge"
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}

# public_key is required for the create step
variable "public_key" {
  type = string
  default = ""
}
