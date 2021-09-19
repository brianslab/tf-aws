# compute/main.tf

data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

resource "random_id" "tf-aws_node_id" {
  byte_length = 2
  count       = var.instance_count
  keepers = {
    key_name = var.key_name
  }
}

resource "aws_key_pair" "tf-aws_auth" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "tf-aws_node" {
  count                  = var.instance_count
  vpc_security_group_ids = [var.public_sg]
  subnet_id              = var.public_subnets[count.index]
  instance_type          = var.instance_type
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.tf-aws_auth.id
  user_data = templatefile(var.user_data_path,
    {
      nodename    = "tf-aws-node-${random_id.tf-aws_node_id[count.index].dec}"
      db_endpoint = var.db_endpoint
      dbname      = var.dbname
      dbuser      = var.dbuser
      dbpass      = var.dbpassword
  })
  root_block_device {
    volume_size = var.vol_size
  }
  tags = {
    Name = "tf-aws-node-${random_id.tf-aws_node_id[count.index].dec}"
  }
}

