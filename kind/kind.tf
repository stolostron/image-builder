# Random suffix
resource "random_id" "suffix" {
  byte_length = 3
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Create the security group to allow ssh access
module "ssh_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/ssh"
  
  name = "prow-kind-ssh-${random_id.suffix.hex}"
  description = "Prow KinD SG: allows inboud ssh from everywhere"
  vpc_id = data.aws_vpc.default.id
  
  ingress_cidr_blocks =["0.0.0.0/0"]
}

# Create the key pair for use with ssh
resource "aws_key_pair" "kind" {

  key_name   = "prow-kind-key-${random_id.suffix.hex}"
  public_key = var.public_key
}

# Fetch the KinD AMI
data "aws_ami" "kind_image" {
  owners      = ["151448548300"]
  most_recent = true
  filter {
    name   = "name"
    values = ["acm-kind-*"]
  }
}

# Create the EC2 instance
resource "aws_instance" "kind" {
  ami           = data.aws_ami.kind_image.id
  instance_type = var.aws_instance_type 
  key_name      = aws_key_pair.kind.key_name
  vpc_security_group_ids = [ module.ssh_sg.security_group_id ]

  tags = {
    Name = "prow-kind-${random_id.suffix.hex}"
  }
}
