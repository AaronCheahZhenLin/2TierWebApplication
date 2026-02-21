
output "DNSName" {
  value       = module.LoadBalancer.DNSName
  description = "The dns name of the web server instances."
}
