variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.medium"
}

variable "ami_id" {
  type    = string
  default = "ami-04b70fa74e45c3917" # Ubuntu
}
