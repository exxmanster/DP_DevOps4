variable "ec2_count" {
  default = "1"
}
variable "ami_id" {
  default = "ami-05d34d340fb1d89e5"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" {}
variable "vpc_security_group_ids_instance"{
  default = "[aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]"
}
variable "iam_prfile"{
  default = "SMMRole"
}
variable "key_name"{
 default = "aws_key_pair.ssh-key-from-bastion.key_name"
}
variable "tag_name" {}
variable "tag_env" {
  default = "edu"
}
variable "tag_type" {}