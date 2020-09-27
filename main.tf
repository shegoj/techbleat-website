provider aws {
    profile = var.profile
    region = var.region
}

terraform {
  backend "s3" {
    bucket = "shegoj-tfstate"
    key    =  "prod100/terraform.tfstate"
    region  =  "eu-west-1"
  }
}

resource aws_instance "hello" {
    
    ami           = var.ami
    instance_type = var.instance_type
    key_name = var.key

    tags  = {
        Name = "simple node"
        spec = "simple spec"
    }
    
}

output "ec2-output" {
    value = "${aws_instance.hello.public_ip} is the IP"
}
