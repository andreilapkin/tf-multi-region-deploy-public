module "us_east_1" {
  source      = "./us_east_1"
  global_vars = "${local.global_vars}"
}

module "eu_north_1" {
  source      = "./eu_north_1"
  global_vars = "${local.global_vars}"
}