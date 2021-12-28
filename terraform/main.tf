terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}
resource "aws_key_pair" "ssh-key-to-bastion" {
  key_name   = "to-bastion-key"
  public_key = file("id_rsa.pub")
}

resource "aws_key_pair" "ssh-key-from-bastion" {
  key_name   = "from-bastion-key"
  public_key = file("bastion_id.pub")
}

# output "lb_url" {  
#   description = "URL of load balancer"  
#   value       = "http://${aws_alb.main.public_dns}/"
#   }

  output "bastion_pub_ip" {  
  description = "Bastion Public IP"  
  value       = "${aws_instance.bastion.public_ip}"
  }

  output "web1_priv_ip" {  
  description = "web1 private IP"  
  value       = "${aws_instance.web1.private_ip}"
  }