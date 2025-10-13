locals {
  name_prefix = random_string.suffix.result
}

resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}
