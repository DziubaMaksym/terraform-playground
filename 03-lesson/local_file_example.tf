# Create a local file
resource "local_file" "example" {
  count      = 5
  depends_on = [random_password.password]
  provider   = local.new_local
  content    = "Hello, Terraform!\nPassword: ${random_password.password.result}\nIP: ${var.ip}"
  filename   = "${path.module}/example${count.index}.txt"

}

