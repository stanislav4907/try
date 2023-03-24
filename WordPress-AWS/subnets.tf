# Create 3 public subnets
resource "aws_subnet" "public_subnet" {
  count = 3

  cidr_block = "10.0.${count.index}.0/24"
  vpc_id = aws_vpc.wordpress_vpc.id
   availability_zone = data.aws_availability_zones.available.names[count.index]
 tags = {
        Name = "Public subnet in ${data.aws_availability_zones.available.names[count.index]}"
    }
}

# Create 3 private subnets
resource "aws_subnet" "private_subnet" {
  count = 3
  cidr_block = "10.0.${count.index + 10}.0/24"
  vpc_id = aws_vpc.wordpress_vpc.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
    tags = {
        Name = "Private subnet in ${ data.aws_availability_zones.available.names[count.index]}"
    }

}