variable "ami" {
  default = "ami-017b679ef539c260f"
}

variable "cluster_size" {
  default = 3
}

variable "domain" {
  default = "etcd.local"
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
variable "hosted_zone_id" {}
