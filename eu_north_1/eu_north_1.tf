provider "aws" {
  profile = "default"
  region  = "${local.region_vars.region}"
}

module "test" {
  source      = "./test"
  region_vars = "${local.region_vars}"
}