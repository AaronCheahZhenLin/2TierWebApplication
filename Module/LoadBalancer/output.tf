output "DNSName" {
  value       = aws_lb.alb.dns_name
  description = "The dns name of the web server instances."
}

