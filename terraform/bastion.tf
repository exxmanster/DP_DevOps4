resource "aws_instance" "bastion" {
  ami                    = "ami-05d34d340fb1d89e5"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public1.id
  key_name               = aws_key_pair.ssh-key-to-bastion.key_name
  iam_instance_profile   = "SSMRole"
  vpc_security_group_ids = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]


  provisioner "file" {
    source      = "bastion_id"
    destination = "/home/ec2-user/.ssh/id_rsa"

  }

  connection {
    type = "ssh"
    user = "ec2-user"
    host = aws_instance.bastion.public_ip

  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 600 /home/ec2-user/.ssh/id_rsa",
      "sudo yum update -y && sudo yum install -y python3-pip && pip3 install ansible boto3",
      "sudo ansible-galaxy collection install amazon.aws",
      "sudo yum install -y git && git clone https://github.com/exxmanster/DP_DevOps4.git "
    ]
  }
  tags = {
    Name = "bastion"
  }
}