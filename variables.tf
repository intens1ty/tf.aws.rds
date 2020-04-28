variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnet" {
  type    = list(string)
  default = [ "10.0.21.0/24", "10.0.22.0/24" ]
}

variable "availability_zone" {
  type    = list(string)
  default = [ "eu-central-1a", "eu-central-1b" ]
}

variable "availability_zone_1" {
  type    = string
  default = "eu-central-1a"
}

variable "availability_zone_2" {
  type    = string
  default = "eu-central-1b"
}

variable "db_node_type" {
  type    = string
  default = "db.t2.micro"
}

variable "password" {
  type    = string
  default = ""
}