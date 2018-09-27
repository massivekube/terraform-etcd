resource "aws_lb_target_group" "etcd" {
  name     = "etcd"
  port     = 2380
  protocol = "TCP"
  vpc_id   = "${var.vpc_id}"
}
