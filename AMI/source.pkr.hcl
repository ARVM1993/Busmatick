source "amazon-ebs" "ubuntu" {
    region = var.region
    instance_type = "t2.micro" #Instancia temporal hasta el snapshot

    source_ami_filter { #Filtros de busqueda de la ami
        filters = {
            name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
            root-device-type = "ebs" #Guardar el snapshot
            virtualization-type = "hvm" #Tipo de virtualización
        }
        most_recent = true #imagen más reciente que cumpla con los filtros
        owners = ["099720109477"] #Propietario de la imagen según ID Canonico
    }

    ssh_username = "ubuntu" #Usuario por defecto de la imagen
    ami_name = "ubuntu-2204-{{timestamp}}" #Nombre de la imagen

    tags = {
        app = "Busmatick"
        purpose = "automation"
        env = "deployment"
        version = "1.0.0"
    }
}
