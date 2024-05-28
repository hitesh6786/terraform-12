terraform {
    backend "s3" {
        bucket = "terraform-bucket-27-5-2024"
        key = "hitesh-terraform/terraform.tfstate"
        region = "us-east-1"
       
       

      
    }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
  }
}

provider "aws" {
 
  region  = "us-east-1"
  # Configuration options
}




#instance


resource "aws_instance" "Public-ec2" {
  ami           = data.aws_ami.amazonlinux.id
  instance_type = "t2.micro"
  count=          1
  key_name = "terraform-keypair"

  
  
tags = {
    Name = "Public-ec2-1"
  }
}


#instance


#data source

data "aws_ami" "amazonlinux" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
}

  filter {
    name = "architecture"
    values= ["x86_64"]
  }

}


