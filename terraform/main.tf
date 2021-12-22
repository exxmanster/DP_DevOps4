terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}
resource "aws_key_pair" "ssh-key" {
  key_name   = "dell-key"
  public_key = file("id_rsa.pub")
}