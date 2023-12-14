# Output the path of the created file
output "file_path" {
  description = "File created at:"
  value       = local_file.example.filename
}

# Output the current time
output "current_time" {
  description = "Current time is:"
  value       = time_static.current.rfc3339
}

# Output the generated password
output "generated_password" {
  description = "The generated password is:"
  value       = random_password.password.result
  sensitive   = true
}
