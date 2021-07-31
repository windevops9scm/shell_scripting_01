variable "sample" {
  default = "this section deals with variables"
}
output "sample" {
  value = var.sample
}

variable "sample2" {

}
output "sample2" {
  value = var.sample2
}
variable "string" {
  default = "hello"
}

variable "number" {
  default = 10
}
variable "boolean" {
  default = false
}

output "string" {
  value = var.string
}

output "number" {
  value = var.number
}

output "boolean" {
  value = var.boolean
}
output "data_types" {
  value = String = ${var.string}
}