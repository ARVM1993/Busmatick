variable "instance_count" {
    description = "Numero de instancias EC2 a crear."
    type        = number
}

#variable "ami_id" {
#    type        = string
#}

variable ami {
    type = string
    description = "AMI del data source"
}

variable "instance_type" {
    description = "Tipo de instancia EC2 a crear."
    type        = string
}

variable "key_name" {
    description = "Nombre clave par."
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