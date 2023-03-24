aws_region    = "us-east-1"
port_list     = ["80", "443"]
instance_size = "t3.small"
key_pair      = "laptop"

tags = {
  Group       = "AWS-Team2"
  Environment = "Prod"
  Project     = "WordPress"
}