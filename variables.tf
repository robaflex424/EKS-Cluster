
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "public_subnets_ipv4_cidr1" {
  default = "10.0.0.0/19"
}
variable "public_subnets_ipv4_cidr2" {
  default = "10.0.32.0/19"
}
variable "az_id" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}
variable "all_ipv4" {
  default = "0.0.0.0/0"
}