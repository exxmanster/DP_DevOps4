module "ec2-web1" {
  source    = ".//modules/ec2"
  subnet_id = aws_subnet.private1.id
  sg_ids    = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "web1"
  tag_type  = "web"
}


module "ec2-web2" {
  source = ".//modules/ec2"

  subnet_id = aws_subnet.private2.id
  sg_ids    = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "web2"
  tag_type  = "web"
}


module "ec2-db1" {
  source = ".//modules/ec2"

  subnet_id = aws_subnet.private1.id
  sg_ids    = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
  key_name  = aws_key_pair.ssh-key-from-bastion.key_name
  tag_name  = "db1"
  tag_type  = "db"
}

