# 01_VPC
cidr_block = "10.0.0.0/16"
public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zone = ["ap-south-1a", "ap-south-1b"]
# 02_ASG

#alb
alb_sg_name = "alb-security-group"
alb_sg_ports = ["80","443"]
 #web
web_sg_name = "web-security-group"
web_sg_ports =["80","443"]
#app
app_sg_name = "app-security-group"
app_sg_ports = ["8080"]
#rds
rds_sg_name = "rds-security-group"
rds_sg_ports = ["3306"] 


#03_ALB

lb_name = "cloudethix-lb"
lb_type = "application"

#06_EC2

ami_id = "ami-0cca134ec43cf708f"
instance_type = "t2.micro"

#07_SSH_KEY

ssh_key_name = "cloudethix-ssh-key"
ssh_key_path = "/root/.ssh/id_rsa.pub"

#04_RDS

rds_storage_size = 10
rds_name = "cloudethhix-db"
rds_type = "db.t3.medium"
username = "admin"


#S3

bucket_name = "cloudethix-sarfaraz-bucket"
