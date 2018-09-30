resource "aws_lb" "etcd" {
  name_prefix                = "etcd-"
  internal                   = true
  load_balancer_type         = "network"
  subnets                    = ["${var.vpc_subnets}"]
  enable_deletion_protection = false
  security_groups            = ["${aws_security_group.etcd_lb.id}"]
}

resource "aws_lb_target_group" "etcd" {
  name     = "etcd"
  port     = 2380
  protocol = "TCP"
  vpc_id   = "${var.vpc_id}"

  health_check {
    port     = 2380
    interval = 30
  }
}

resource "aws_lb_listener" "controllers" {
  load_balancer_arn = "${aws_lb.etcd.arn}"
  port              = "2380"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_lb_target_group.etcd.arn}"
    type             = "forward"
  }
}
