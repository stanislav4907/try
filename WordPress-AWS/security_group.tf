resource "aws_security_group" "db" {
  name_prefix = "db"
  # name        = "allow_mysql_inbound_traffic"
  description = "Allow 3306 inbound traffic"
  # vpc_id      = aws_vpc.wordpress_vpc.id
  ingress {
    description = "mysql"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}