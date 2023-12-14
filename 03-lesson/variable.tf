variable "input" {
  description = "test of input"
  type        = number
}
variable "ip" {
  type        = string
  description = "Input must be a valid IPv4 address"

  validation {
    condition     = can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.ip))
    error_message = "The IP address must be a valid IPv4 address in the format 'x.x.x.x', where x is a number between 0 and 255."
  }
}
