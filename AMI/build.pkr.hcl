build {
    sources = ["source.amazon-ebs.ubuntu"] #utiliza el source como base de la AMI

    provisioner "shell" {
        inline = [ #comandos ejecución de la instancia
            "sudo apt-get update",
            "sudo apt-get install -y mariadb-server",
            "sudo systemctl enable mariadb",
            "sudo systemctl start mariadb"
        ]
    }

    post-processor "manifest" {}
}