
resource "aws_instance" "web1" {
  ami           = "ami-05d34d340fb1d89e5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private1.id
  key_name = aws_key_pair.ssh-key-from-bastion.key_name
  iam_instance_profile = "SSMRole"
  vpc_security_group_ids = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
  user_data = file("nginx-userdata.sh")

  tags = {
    Name = "Web 1"
   }
}
resource "aws_instance" "web2" {
  ami           = "ami-05d34d340fb1d89e5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private2.id
  key_name = aws_key_pair.ssh-key-from-bastion.key_name
  iam_instance_profile = "SSMRole"
  vpc_security_group_ids = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
  user_data = file("nginx-userdata.sh")
  tags = {
    Name = "Web 2"
   }
}

resource "aws_instance" "db1" {
  ami           = "ami-05d34d340fb1d89e5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private1.id
  key_name = aws_key_pair.ssh-key-from-bastion.key_name
  iam_instance_profile = "SSMRole"
  vpc_security_group_ids = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
  user_data = file("nginx-db-userdata.sh")
  tags = {
    Name = "db1"
   }
}

resource "aws_instance" "db2" {
  ami           = "ami-05d34d340fb1d89e5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private2.id
  key_name = aws_key_pair.ssh-key-from-bastion.key_name
  iam_instance_profile = "SSMRole"
  vpc_security_group_ids = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
  user_data = file("nginx-db-userdata.sh")
  tags = {
    Name = "db2"
   }
}

resource "aws_instance" "bastion" {
  ami           = "ami-05d34d340fb1d89e5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public1.id
  key_name = aws_key_pair.ssh-key-to-bastion.key_name
  iam_instance_profile = "SSMRole"
  vpc_security_group_ids = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
  
  provisioner "file" {
    source = "bastion_id"
    destination = "/home/ec2-user/.ssh/id_rsa"

  }
  
  connection {
      type = "ssh"
      user = "ec2-user"
      host = "${aws_instance.bastion.public_ip}"
  }

provisioner "remote-exec" {    
  inline = [
    "sudo chmod 600 /home/ec2-user/.ssh/id_rsa",
    "sudo yum update -y && sudo yum install -y python3-pip && pip3 install ansible"
  ]


}
  tags = {
    Name = "bastion"
   }
}
