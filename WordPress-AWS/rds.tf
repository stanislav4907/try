resource "aws_db_instance" "default" {
  allocated_storage          = 50
  engine                     = "mysql"
  engine_version             = "5.7"
  instance_class             = "db.t3.small"
  db_name                     = "rds_name"
  username                   = "admin"
  password                   = "password"
  storage_type               = "gp2"
  skip_final_snapshot        = true
  auto_minor_version_upgrade = true
  storage_encrypted          = false
  max_allocated_storage      = 500

}
