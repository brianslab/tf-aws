# networking/main.tf

resource "random_integer" "random" {
  min = 1
  max = 100
}

resource "aws_vpc" "tf-aws_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "tf-aws_vpc-${random_integer.random.id}"
  }
}

resource "aws_subnet" "tf-aws_public_subnet" {
  count                   = length(var.public_cidrs)
  vpc_id                  = aws_vpc.tf-aws_vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"][count.index]

  tags = {
    Name = "tf-aws_public_${count.index + 1}"
  }
}