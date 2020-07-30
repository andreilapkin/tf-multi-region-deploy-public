locals {
    global_vars = {
      origin            = "terraform"
      global_config_map = {
          var1 = "value1"
          var2 = "value2"
          var3 = "value3"
      }
  }
}