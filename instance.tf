

resource "aws_launch_configuration" "web-server" {

    image_id = "ami-0d527b8c289b4af7f"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.instance.id]

    user_data = <<-EOF
        #!/bin/bash
        echo "Hello World" > index.html
        nohup busybox httpd -f -p ${var.server_port} &
        EOF

    lifecycle {
        create_before_destroy = true
    }
  
}


resource "aws_autoscaling_group" "web-scaling" {
    launch_configuration = aws_launch_configuration.web-server.name
    #vpc_zone_identifier = data.aws_subnet_ids.default.id
    availability_zones = ["eu-central-1a"]

    min_size = 2
    max_size = 10

    tag {
        key = "Name"
        value = "terraform-asg-example"
        propagate_at_launch = true
    }
  
}