resource "aws_instance" "test" {
  ami                    = "ami-07ebfd5b3428b6f4d"
  subnet_id              = "${data.aws_subnet.subnet.0.id}"                 # Set preferred subnet_id number from 0 to n (sorted by subnet_id, not by az name)
  instance_type          = "t2.micro"
  key_name               = "${var.region_vars.public_keys["main"]}"
  vpc_security_group_ids = ["${aws_security_group.test_group.id}"]

  tags = {
    Name                 = "test"
    origin               = "${var.region_vars["origin"]}"
    global_var          = "${var.region_vars.global_config_map["var1"]}"
  }

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "100"
    volume_size           = "8"
    volume_type           = "gp2"
  }
}