terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

module "vpc" {
  source = "./modules/vpc"

}

# module "ec2" {
#   source           = "./modules/ec2"
#   vpc_idr          = module.vpc.vpc_id
#   public_subnet_id = module.vpc.subnet_id
#   sg_id            = module.vpc.sg
#   # db_sg_rrg        = module.rds.db_sg_rrg
# }

module "alb" {
  source = "./modules/lb"
  rrg_sg_id = module.vpc.sg
  vpc_id_rrg = module.vpc.vpc_id
  public_subnet_1 = module.vpc.subnet_id
  public_subnet_2 = module.vpc.subnet_id2
  # instance_id = module.ec2.private_ip
}

module "asg" {
  source = "./modules/asg"
  sg_id = module.vpc.sg
  # lb_id = module.alb.lb_id
  tg_arn = module.alb.tg_arn
  zone = [module.vpc.subnet_id, module.vpc.subnet_id2]
}
# module "rds" {
#   source                  = "./modules/rds"
#   vpc_id_rrg              = module.vpc.vpc_id
#   private_subnet_id_rrg_1 = module.vpc.private_subnet_id
#   private_subnet_id_rrg_2 = module.vpc.private_subnet_id-2
#   sg_id                   = module.vpc.sg
#   rrg_username            = var.rrg_uname
#   rrg_password            = var.rrg_pw
# }