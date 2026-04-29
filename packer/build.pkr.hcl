build {
    sources = ["source.amazon-ebs.ubuntu"] #utiliza el source como base de la AMI

    provisioner "ansible" {
        playbook_file = "../ansible/playbook.yml"
        user = "ubuntu"
        
    }
}