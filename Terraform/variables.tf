variable "vpc_cidr" {
  description = "This is the cidr value for the vpc"
  type = string
  default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  description = "This is the cidr value for the subnet1"
  type = string
  default = "10.0.0.0/24"
}

variable "subnet2_cidr" {
  description = "This is the cidr value for subnet2"
  type = string
  default = "10.0.1.0/24"
}
