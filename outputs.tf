output "public_dns_arya" {
  description = "Public IPv4 DNS"
  value       = try(aws_instance.arya.public_dns)
}

output "public_dns_elleven" {
  description = "Public IPv4 DNS"
  value       = try(aws_instance.elleven.public_dns)
}

# output "public_dns_the_mirror" {
#   description = "Public IPv4 DNS"
#   value       = try(aws_instance.the_mirror.public_dns)
# }

# output "public_dns_enola" {
#   description = "Public IPv4 DNS"
#   value       = try(aws_instance.enola.public_dns)
# }

# output "public_dns_livisco" {
#   description = "Public IPv4 DNS"
#   value       = try(aws_instance.livisco.public_dns)
# }

output "public_dns_eva" {
  description = "Public IPv4 DNS"
  value       = try(aws_instance.eva.public_dns)
}
output "start_url_elleven" {
  description = "url for start to EC2 instance"
  value       = aws_lambda_function_url.to_start_instance_url_elleven
}
output "stop_url_elleven" {
  description = "url for start to EC2 instance"
  value       = aws_lambda_function_url.to_stop_instance_url_elleven
}
output "start_url_eva" {
  description = "url for start to EC2 instance"
  value       = aws_lambda_function_url.to_start_instance_url_eva
}
output "stop_url_eva" {
  description = "url for start to EC2 instance"
  value       = aws_lambda_function_url.to_stop_instance_url_eva
}
output "start_url_arya" {
  description = "url for start to EC2 instance"
  value       = aws_lambda_function_url.to_start_instance_url_arya
}
output "stop_url_arya" {
  description = "url for start to EC2 instance"
  value       = aws_lambda_function_url.to_stop_instance_url_arya
}
