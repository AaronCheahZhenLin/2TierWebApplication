output "VPC" {
    value = aws_vpc.VPC.id
    description = "VPC ID"
}

output "subnet1" {
    value = aws_subnet.subnet1.id
    description = "Subnet 1 CIDR"
}

output "subnet2" {
    value = aws_subnet.subnet2.id
    description = "Subnet 2 CIDR"
}

output "HTTPandSSH" {
    value = aws_security_group.HTTPandSSH.id
    description = "Security Group of port 80 and 22"
}