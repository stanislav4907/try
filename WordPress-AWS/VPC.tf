
# Create VPC
resource "aws_vpc" "wordpress_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Wordpress_VPC"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.wordpress_vpc.id
  tags = {
    Name = "Wordpress_IGW"
  }
}

# Create internet route table for public subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.wordpress_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Wordpress_IGW_RT"
  }
}

# Create NAT gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.private_subnet[0].id
  depends_on = [aws_internet_gateway.igw, aws_eip.nat_eip]
    
  tags = {
    Name = "Wordpress_NAT_GW"
  }
}

# Create NAT gateway EIP
resource "aws_eip" "nat_eip" {
  vpc = true
}

# Create private route table for private subnets
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.wordpress_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
    tags = {
    Name = "Wordpress_NAT_RT"
  }
}

# Associate public subnets with public route table
resource "aws_route_table_association" "public_association" {
  count = 3
  subnet_id = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate private subnets with private route table
resource "aws_route_table_association" "private_association" {
  count = 3
  subnet_id = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}
