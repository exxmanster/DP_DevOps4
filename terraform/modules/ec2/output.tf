output "instance" {
  description = "The instance"
  value       = aws_instance.DP4[*].id
}
