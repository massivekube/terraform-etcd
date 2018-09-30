variable "ami" {
  default = "ami-0d7917aeb0baa27bf"
}

variable "cluster_size" {
  default = 3
}

variable "instance_type" {
  default = "m5.large"
}

variable "storage_size" {
  default = 64
}

variable "storage_iops" {
  default = 200
}

variable "vpc_id" {}

variable "vpc_subnets" {
  type = "list"
}

variable "hosted_zone_id" {}
