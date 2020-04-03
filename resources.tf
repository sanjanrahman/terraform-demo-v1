# Define SSH key pair for our instances
resource "aws_key_pair" "terraform" {
  key_name = "terraform"
  public_key = file("dev-server-new.pem")
}

# Define webserver inside the public subnet
resource "aws_instance" "wb" {
   ami  = "var.ami"
   instance_type = "t2.micro"
   key_name = "aws_key_pair.terraform.id"
   subnet_id = "aws_subnet.public-subnet.id"
   vpc_security_group_ids = ["aws_security_group.sgweb.id"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = file("userdata.sh")

  tags= {
    Name = "webserver"
  }
}

# Define database inside the private subnet
resource "aws_instance" "db" {
   ami  = "var.ami"
   instance_type = "t2.micro"
   key_name = "aws_key_pair.terraform.id"
   subnet_id = "aws_subnet.private-subnet.id"
   vpc_security_group_ids = ["aws_security_group.sgdb.id"]
   source_dest_check = false

  tags= {
    Name = "database"
  }
}
