variable "class" {
  default = "devops"
}

## Print the same in capital letters
output "class" {
  value = upper(var.class)
}