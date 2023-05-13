terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

resource "aws_launch_configuration" "rrg_lc" {
  name_prefix = "roshan"
  instance_type = var.inst_type
  image_id = var.img_id
  security_groups = [var.sg_id]
  key_name = var.key_name
  user_data = <<-EOF
        #!/bin/bash
        sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get autoremove -y
        sudo apt-get install -y apache2
        sudo apt-get install -y php
        cd /var/www/html
        sudo rm -rf index.html
        sudo git clone https://github.com/VtechRoShan/User_data_IndexFile.git
        sudo mv User_data_IndexFile/index.php .
        sudo rm -rf  User_data_IndexFile
        EOF
}

resource "aws_autoscaling_group" "rrg_asg" {
  name = "rrg_asg"
  launch_configuration = aws_launch_configuration.rrg_lc.id
  vpc_zone_identifier = var.zone
  min_size = 1
  max_size = 3
  health_check_type = "ELB"
  # load_balancers=["var.lb_id"]
  target_group_arns = [var.tg_arn]
  tags = [{
      Key = "Name"
      value = "rrg_name"
    },
    {
      key = "Owner"
      value = "Roshan Raman Giri"
    }
  
  ]
}
