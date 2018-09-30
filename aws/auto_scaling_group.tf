resource "aws_autoscaling_group" "etcd" {
  name_prefix               = "etcd-"
  launch_configuration      = "${aws_launch_configuration.etcd.name}"
  min_size                  = "${var.cluster_size}"
  max_size                  = "${var.cluster_size}"
  default_cooldown          = 5
  termination_policies      = ["OldestInstance", "ClosestToNextInstanceHour"]
  target_group_arns         = ["${aws_lb_target_group.etcd.id}"]
  placement_group           = "${aws_placement_group.etcd.id}"
  vpc_zone_identifier       = ["${var.vpc_subnets}"]
  health_check_type         = "ELB"
  health_check_grace_period = 60

  tag {
    key                 = "massive:DNS-SD:ports"
    value               = "2380,2379"
    propagate_at_launch = false
  }

  tag {
    key                 = "massive:DNS-SD:names"
    value               = "_etcd-server-ssl._tcp.${data.aws_route53_zone.selected.name},_etcd-client-ssl._tcp.${data.aws_route53_zone.selected.name}"
    propagate_at_launch = false
  }

  tag {
    key                 = "massive:DNS-SD:Route53:zone"
    value               = "${var.hosted_zone_id}"
    propagate_at_launch = false
  }

  lifecycle {
    create_before_destroy = true
  }
}
