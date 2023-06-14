variable "class" {
  default = "devops"
}

## Print the same in capital letters
output "class" {
  value = var.class
}