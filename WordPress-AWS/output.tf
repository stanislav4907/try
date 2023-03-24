
output "public_ip" {
  value = aws_eip.nat_eip.public_ip
}

output "security_group_id" {
  value = aws_security_group.web.id
}

output "azs_available" {
    value = data.aws_availability_zones.available.names
}

output "address" {
  value = aws_db_instance.default.address
}

output "availability_zone" {
  value = aws_db_instance.default.availability_zone
}

output "engine" {
  value = aws_db_instance.default.engine
}

output "id" {
  value = aws_db_instance.default.id
}

output "port" {
  value = aws_db_instance.default.port
}