resource "aws_security_group" "instance" {
    
    name = "terraform-example-instance"

    ingress {
        description      = "TLS from VPC"
        from_port        = var.server_port
        to_port          = var.server_port
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
      "Name" = "Default Security group for EC2 Web-Server"
      "Environment" = "Development"
    }
  
}