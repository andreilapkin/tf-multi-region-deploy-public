# Get variables from Global
variable "region_vars" {}

data "aws_subnet_ids" "subnets" {
  vpc_id = "${var.region_vars["vpc_id"]}"
}

data "aws_subnet" "subnet" {
  count = "${length(data.aws_subnet_ids.subnets.ids)}"
  id    = "${tolist(data.aws_subnet_ids.subnets.ids)[count.index]}"
}