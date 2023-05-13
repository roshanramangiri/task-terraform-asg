#Creating EC2 instance
resource "aws_instance" "rrg_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  key_name               = "rrg"
  vpc_security_group_ids = [var.sg_id]
  # vpc_security_group_ids = [var.sg_id, var.db_sg_rrg]
  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }
  tags = merge(
    var.tags, local.tags
  )
}


# #Create EC2 Instance
# resource "aws_instance" "rrg_ec2" {
#     ami = var.ami_name
#     instance_type = "t2.micro"
#     #vpc_id = aws_vpc.vpc_rrg.id
#     subnet_id = aws_subnet.public_1.id
#     vpc_security_group_ids = [aws_security_group.rrg_sg.id]
#     key_name = "rrg"
#     root_block_device {
#       volume_size = 8
#       volume_type = "gp3"
#     }
#     tags = {
#         Name = "rrg_ec2"
#         Owner = var.owner_name
#         Env = "Test"
#     }     
# }