variable "instance_count" {
    description = "The number of EC2 instances to create."
    type        = number
}

variable "ami_id" {
    description = "The ID of the AMI to use for the EC2 instances."
    type        = string
}

variable "instance_type" {
    description = "The type of EC2 instance to create."
    type        = string
}

variable "key_name" {
    description = "The name of the key pair to use for the EC2 instances."
    type        = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "user_data" {
    type = string
    default = ""
}

variable "subnet_id" {
  type = string
}