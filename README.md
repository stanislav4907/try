# terraform-wordpress
Project covers Terraform code for VPC design on different cloud platforms: AWS &amp; Azure &amp; GCP

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

