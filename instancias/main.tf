provider "aws" {
    region = var.region
}

data "aws_ami" "busmatick_ubuntu" {
    most_recent = true
    owners = ["self"]

    filter {
        name = "tag:app"
        values = ["Busmatick"]
    }

    filter {
      name = "tag:purpose"
      values = ["automation"]
    }

    filter {
        name = "tag:env"
        values = ["deployment"]
    }
    
}

module "vpc" {
    source = "./modules/vpc"
    cidr_block = "10.0.0.0/16"
    name = "mi-vpc"
}

module "subnet" {

    source = "./modules/subnet"
    vpc_id = module.vpc.vpc_id
    cidr_block = "10.0.1.0/24"
    az = "us-east-1a"
    name = "subnet-publica"
    map_public_ip_on_launch = true

}

module "internet_gateway" {
    source = "./modules/internet_gateway"
    vpc_id = module.vpc.vpc_id
    name = "igw"

}

module "route_table" {
  source = "./modules/route_table"

  vpc_id    = module.vpc.vpc_id
  igw_id    = module.internet_gateway.igw_id
  subnet_id = module.subnet.subnet_id
  name      = "rt-publica"
}

module "sg" {
    source = "./modules/security_group"
    vpc_id = module.vpc.vpc_id
}

module "ec2" {
    source = "./modules/ec2"

    instance_count = 1
    ami = data.aws_ami.busmatick_ubuntu.id
    instance_type = "t2.micro"
    key_name = "AWS"
    subnet_id = module.subnet.subnet_id
    security_group_ids = [module.sg.security_group_id]



#    user_data = file("${path.module}/user_data.sh")
}