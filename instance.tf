resource "aws_instance" "web-server" {

    ami = "ami-0d527b8c289b4af7f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
        #!/bin/bash
        echo "Hello World" > index.html
        nohup busybox httpd -f -p ${var.server_port} &
        EOF

    tags = {
      "Name" = "terraform-example"
    }
  
}

output "public_ip" {
    
    value = aws_instance.web-server.public_ip
    description = "The public IP address of the EC2 instance"
}