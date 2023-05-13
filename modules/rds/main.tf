resource "aws_db_instance" "rrg_db" {
  allocated_storage        = 10
  db_name                  = "rrg_db"
  engine                   = "mysql"
  instance_class           = "db.t2.micro"
  skip_final_snapshot      = true
  delete_automated_backups = true
  username                 = var.rrg_username
  password                 = var.rrg_password
  vpc_security_group_ids   = [var.sg_id, aws_security_group.rds_security_group.id]
  multi_az                 = false
  db_subnet_group_name     = aws_db_subnet_group.db_subnetgroup_rrg.name
  tags = {
    Name = "db_rrg"
    User = "Roshan Raman Giri"
  }
}

resource "aws_security_group" "rds_security_group" {
  name_prefix = "rds-security-group"
  vpc_id      = var.vpc_id_rrg

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = -1
  }

  tags = {
    Name = "RDS Security Group"
  }
}

resource "aws_db_subnet_group" "db_subnetgroup_rrg" {
  name       = "db_subnetgroup_rrg"
  subnet_ids = [var.private_subnet_id_rrg_1, var.private_subnet_id_rrg_2]
}