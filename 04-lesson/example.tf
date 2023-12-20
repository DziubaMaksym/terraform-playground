# Using locals for common configurations
locals {
  file_count = 5
  prefix     = "file"
}

# Generate a random string
resource "random_string" "random" {
  count   = local.file_count
  length  = 8
  special = false
}

# Generate a timestamp
resource "time_rotating" "example" {
  rotation_days = 1
}

# Create multiple local files using count and random strings
resource "local_file" "random_file" {
  count    = local.file_count
  filename = "${local.prefix}-${count.index}.txt"
  content  = "Random String: ${random_string.random[count.index].result}"
}

# Create a file that depends on the timestamp
resource "local_file" "timestamp_file" {
  depends_on = [time_rotating.example]
  filename   = "timestamp.txt"
  content    = "Timestamp: ${time_rotating.example.rotation_rfc3339}"
}

# Create files using for_each based on a condition with lifecycle
resource "local_file" "conditional_file" {
  for_each = { for idx, rs in random_string.random : idx => rs if idx < 3 }
  filename = "conditional-${each.key}.txt"
  content  = "Conditional Content: ${each.value.result}"

  lifecycle {
    create_before_destroy = true
  }
}

