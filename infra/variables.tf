variable "region" {
    type = string
    default = "us-east-1" 
}

variable "vpc_id" {
    type = string
    default = "null"
}

variable "instance_name" {
    type = string
    default = "null"  
}

variable "instance_type" {
    type = string
    default = "null"
}

variable "volume_name" {
    type = string
    default = "null"
  
}

variable "volume_size" {
    type = number
    default = 10
  
}

variable "sg_name" {
    type = string
    default = "null"
  
}

variable "allowed_ssh_cidr_blocks" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
  
}

variable "allowed_https_cidr_blocks" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}

variable "key_name" {
    type = string
    default = "terraform.pem"
  
}