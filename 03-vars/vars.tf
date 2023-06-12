variable "sample" {
  default = 100
}

variable "sample1" {
  default = "Hello World"
}
output "sample1_var" {
  value = var.sample1
}
output "sample_var" {

  value = var.sample
}
## Sometime if varaible/any reference with combination of some other string then we want to access those in ${}
output "sample-ext" {
  value = "Value od sample - ${var.sample}"
}