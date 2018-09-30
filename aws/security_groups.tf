resource "aws_security_group" "etcd_lb" {
  name        = "etcd-lb"
  description = "Etcd LB Security Group"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name = "etcd_lb"
  }
}

resource "aws_security_group" "etcd_server" {
  name        = "etcd-server"
  description = "Etcd Server Security Group"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name = "etcd_server"
  }
}

resource "aws_security_group" "etcd_client" {
  name        = "etcd-client"
  description = "Etcd Client Security Group"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name = "etcd_client"
  }
}
