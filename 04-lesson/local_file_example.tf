# Create a local file
resource "local_file" "example" {
  for_each   = toset(["file", "file1", "file2"])
  depends_on = [random_password.password]
  provider   = local.new_local
  content    = "Hello, Terraform!\nYour rundom password: ${random_password.password.result}"
  filename   = "${path.module}/example-${each.key}.txt"

}

resource "local_file" "my_new_files" {
  for_each = {
    file1 = "my_new_file"
    file2 = "my_new_file2"
  }
  content  = "This is new files ${each.key} and new passwords\nYour rundom password: ${random_password.password.result}"
  filename = "${path.module}/example-${each.value}.txt"
  lifecycle {
    prevent_destroy = true
  }
}
resource "local_file" "my_new_files_1" {
  for_each = {
    file1 = "my_new_file"
    file2 = "my_new_file2"
  }
  content  = "This is new files ${each.key} and new passwords\nYour rundom password: ${random_password.password.result}"
  filename = "${path.module}/example-${each.value}.txt"
  lifecycle {
    prevent_destroy = true
  }
}
