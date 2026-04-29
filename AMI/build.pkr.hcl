build {
    sources = ["source.amazon-ebs.ubuntu"] #utiliza el source como base de la AMI

    provisioner "shell" {
        inline = [ #comandos ejecución de la instancia
      "sudo apt-get update -y",
      "sudo apt-get upgrade -y",
      "sudo apt-get -f install -y",
      "sudo dpkg --configure -a"
      "sudo apt-get install -y mariadb-server",
      "sudo systemctl enable mariadb"
        ]
    }
}