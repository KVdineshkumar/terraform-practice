variable "class" {
  default = "devops"
}

## Print the same in capital letters
output "class" {
  value = upper(var.class)
}
variable "fruits" {
  default = [ "Apple", "Banana", "orange"]
}
output "fruit_count" {
  value = length(var.fruits)
}