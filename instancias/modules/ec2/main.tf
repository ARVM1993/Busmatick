resource "aws_instance" "this" {
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids
  user_data             = var.user_data
  subnet_id = var.subnet_id
  tags = {
    
    Name = "EC2-Busmatick${count.index + 1}"
  }

}