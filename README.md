# terraform-wordpress

Project covers Terraform code for VPC design on different cloud platforms: AWS &amp; Azure &amp; GCP

## STAGE 1 - Build VPC

Build terraform module for a Three-Tier application on AWS:
 VPC includes:
- 3 private 
- 3 public 
Public subnets should have IGW (Internet Gateway) attached to it. 
Private subnets should have NAT  (NAT Gateway) attached to it. 
Configure route tables properly. 

### Test: 
Once private and public subnet created, please create ec2 instance (manually)  on
public subnet and ping google.com. If everything is successful, you should have a proper response. Delete the
instance after verification.

## Definition Of Completion (DOC):

Release the module on terraform registry.




## STAGE 3 - Create RDS Cluster

Create RDS Cluster that has 3 readers and 1 writer. And those rds endpoints
should be available on 
```
writer.yourdomain.com
reader1.yourdomain.com
reader2.yourdomain.com
reader3.yourdomain.com
```
## DOC:

The end result is, hosting a wordpress that creates VPC/ASG/RDS. We should be
able to run terraform apply, and all the components should be available right away


