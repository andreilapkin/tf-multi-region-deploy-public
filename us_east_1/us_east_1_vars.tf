# Get variables from Global
variable "global_vars" {}

locals {

  vars = {
      # Specify region and target VPC
      region         = "us-east-1"                  # REQUIRED #
      vpc_id         = "your_vpc_id"                # REQUIRED # - # Set id of VPC used in this region
      public_keys = {
        "main"       = "key_pair_name"              # REQUIRED # - # Put the name of a key pair used in this region
      }
  }

  region_vars = "${merge(var.global_vars, local.vars)}"
}