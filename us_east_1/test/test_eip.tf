resource "aws_eip" "test_eip" {
  vpc           = true

  tags = {
    Name        = "test-eip"
  }
}

resource "aws_eip_association" "test_eip_assoc" {
  instance_id   = "${aws_instance.test.id}"
  allocation_id = "${aws_eip.test_eip.id}"
}