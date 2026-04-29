variable "vpc_id" {
    description = "The ID of the VPC where the subnet will be created."
    type        = string
}

variable "cidr_block" {
    description = "The CIDR block for the subnet."
    type        = string
}

variable "az" {
    description = "The availability zone for the subnet."
    type        = string
}
variable "name" {
    description = "The name of the subnet."
    type        = string
}

variable "map_public_ip_on_launch" {
    description = "Whether to map public IPs on launch."
    type        = bool
    default     = false
}
