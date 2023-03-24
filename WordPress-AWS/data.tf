# current region
data "aws_region" "current" {}

# current caller name
data "aws_caller_identity" "current" {}


# availble AZs in the region
data "aws_availability_zones" "available" {}

#list of VPCs in the region
data "aws_vpcs" "vpcs" {}
