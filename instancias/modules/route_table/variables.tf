variable "vpc_id" {
    description = "The ID of the VPC where the subnet will be created."
    type        = string
}

variable "igw_id" {
    description = "The ID of the Internet Gateway to attach to the route table."
    type        = string
}

variable "subnet_id" {
    description = "The ID of the subnet to associate with the route table."
    type        = string
}

variable "name" {
    description = "The name of the route table."
    type        = string
}