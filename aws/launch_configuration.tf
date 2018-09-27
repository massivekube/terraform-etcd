resource "aws_launch_configuration" "etcd" {
  iam_instance_profile = "${aws_iam_instance_profile.etcd.id}"
  image_id             = "${var.ami}"
  instance_type        = "${var.instance_type}"
  name_prefix          = "etcd"

  security_groups = [
    "${aws_security_group.etcd_client.id}",
    "${aws_security_group.etcd_server.id}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}
