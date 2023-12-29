locals {
  unsorted_strings = ["foo", "zoo", "baz", "bar", "arm", "car"]
  sorted_strings   = sort(local.unsorted_strings)
}
output "sorted_list" {
  value = local.sorted_strings

}
