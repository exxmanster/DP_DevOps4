# output "bastion_pub_ip" {
#   description = "Bastion Public IP"
#   value       = "ssh ec2-user@${aws_instance.bastion.public_ip}"
# }

# output "web_ips" {
#   description = "Web IP's"
#   value       = "${aws_instance.web1.private_ip}, ${aws_instance.web2.private_ip}"

# }

# output "db_ips" {
#   description = "DBs IP's"
#   value       = "${aws_instance.db1.private_ip}, ${aws_instance.db2.private_ip}"
# }

# #   output "priv_ip" {  
# #   description = "private IPs"  
# #   value       = <<EOT
# # %{ for ip in aws_instance.web*.private_ip ~}
# # ${aws_instance.web*.name} ${ip}
# # %{ endfor ~}
# # EOT
# #   }
