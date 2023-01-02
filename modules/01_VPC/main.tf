// Create the VPC
resource "aws_vpc" "this-vpc" {
  cidr_block = var.cidr_block
  #enable_dns_hostnames = true
}

// Create the SUBNETS

resource "aws_subnet" "this_public_subnet" {
 count = length(var.public_subnet_cidr)
  vpc_id = aws_vpc.this-vpc.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.availability_zone[count.index]
  
}

resource "aws_subnet" "this_private_subnet" {
  count = length(var.private_subnet_cidr)
  vpc_id = aws_vpc.this-vpc.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.availability_zone[count.index]
 
}

// Create an Amazon Elastic IP (EIP)
resource "aws_eip" "this-eip" {
  vpc = true
}

// Create the internet_gateway

resource "aws_internet_gateway" "this-internet-gateway" {
  vpc_id = aws_vpc.this-vpc.id
}


//Create a NAT Gateway

resource "aws_nat_gateway" "this-nat-gateway" {
  allocation_id = aws_eip.this-eip.id
  subnet_id     = aws_subnet.this_public_subnet[0].id
}

#create public route table

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.this-vpc.id
  route {
    cidr_block = var.route_table_association_cidr_block
    gateway_id = aws_internet_gateway.this-internet-gateway.id
  }
}

#create private route table
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.this-vpc.id
  route {
   cidr_block = var.route_table_association_cidr_block
    nat_gateway_id = aws_nat_gateway.this-nat-gateway.id
  }
}

#creating subnet association

resource "aws_route_table_association" "rtb-public" {
  count = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.this_public_subnet[count.index].id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "rtb-private" {
  count = length(var.private_subnet_cidr)
  subnet_id      = aws_subnet.this_private_subnet[count.index].id
  route_table_id = aws_route_table.private-route-table.id
}

