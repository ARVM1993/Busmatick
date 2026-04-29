packer { #configuración general de packer
    required_plugins {
        amazon = {
            source = "github.com/hashicorp/amazon" #repositorio del plugin
            version = "~> 1"
        }
    }
}
