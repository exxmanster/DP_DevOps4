variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_id" {}

variable "privat_subnet1_cidr" {
  default = "10.0.1.0/24"
}

variable "privat_subnet2_cidr" {
  default = "10.0.2.0/24"
}

variable "public_subnet1_cidr" {
  default = "10.0.100.0/24"
}

variable "privat_subnet2_cidr" {
  default = "10.0.1.200/24"
}

