provider "aws" {
  region                  = "${var.region}"
}

resource "aws_subnet" "rdb" {
  count                   = "${length(var.private_subnet)}"
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.private_subnet[count.index]}"
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = false
}

resource "aws_db_subnet_group" "subnetgroup" {
  name       = "subnetgroup"
  subnet_ids = aws_subnet.rdb.*.id
}

resource "aws_security_group" "securitygroup" {
  name        = "securitygroup"
  description = "Allow 5432"
  vpc_id      = "${var.vpc_id}"

  ingress {
    description = "Allow 5432"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12.2"
  instance_class       = "${var.db_node_type}"
  name                 = "postgres"
  username             = "postgres"
  password             = "${var.password}"
  db_subnet_group_name = "subnetgroup"
  multi_az             = true
  port                          = 5432
  vpc_security_group_ids           = ["${aws_security_group.securitygroup.id}"]
  parameter_group_name  = "parametergroup"
}



