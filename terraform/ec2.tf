
resource "aws_instance" "web1" {
  ami           = "ami-05d34d340fb1d89e5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private1.id
  key_name = aws_key_pair.ssh-key.key_name
  iam_instance_profile = "SSMRole"
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  user_data = file("nginx-userdata.sh")

  tags = {
    Name = "Web 1"
   }
}
resource "aws_instance" "web2" {
  ami           = "ami-05d34d340fb1d89e5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private2.id
  key_name = aws_key_pair.ssh-key.key_name
  iam_instance_profile = "SSMRole"
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  user_data = file("nginx-userdata.sh")
  tags = {
    Name = "Web 2"
   }
}

resource "aws_instance" "db1" {
  ami           = "ami-05d34d340fb1d89e5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private1.id
  key_name = aws_key_pair.ssh-key.key_name
  iam_instance_profile = "SSMRole"
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  user_data = file("nginx-db-userdata.sh")
  tags = {
    Name = "db1"
   }
}

resource "aws_instance" "db2" {
  ami           = "ami-05d34d340fb1d89e5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private2.id
  key_name = aws_key_pair.ssh-key.key_name
  iam_instance_profile = "SSMRole"
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  user_data = file("nginx-db-userdata.sh")
  tags = {
    Name = "db2"
   }
}

resource "aws_instance" "bastion" {
  ami           = "ami-05d34d340fb1d89e5"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public1.id
  key_name = aws_key_pair.ssh-key.key_name
  iam_instance_profile = "SSMRole"
  vpc_security_group_ids = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
  
  tags = {
    Name = "bastion"
   }
}