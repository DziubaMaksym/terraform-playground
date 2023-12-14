# Create a local file
resource "local_file" "example" {
  provider = local.new_local
  content  = "Hello, Terraform!\nDate: ${time_static.current.rfc3339}\nPassword: ${random_password.password.result}\nIP: ${var.ip}"
  filename = "${path.module}/example.txt"
}

