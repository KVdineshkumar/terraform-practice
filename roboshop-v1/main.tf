#module "sample1" {
#  source = "./ec2"
#  name = "sample1"
#}
#module "sample2" {
#  source = "./ec2"
#  name = "sample2"
#}
module "instance" {
  for_each = var.instances
  name = each.key
}
 variable "instances" {
   default = {
     frontend = {}
     mongodb = {}
     catalogue = {}
     redis = {}
     user = {}
     cart = {}
     mysql = {}
     shipping = {}
     rabbitmq = {}
     payment = {}
     dispatch = {}
   }
 }
