output "webserver1" {
  value = aws_instance.webserver1.id
  description = "Webserver 1 ID"
}

output "webserver2" {
  value = aws_instance.webserver2.id
  description = "Webserver 2 ID"
}