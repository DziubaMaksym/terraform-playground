# Generate a random password
resource "random_password" "password" {
  length           = var.input
  special          = true
  override_special = "_%@"
}

