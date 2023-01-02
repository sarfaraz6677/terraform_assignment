module "vpc" {
    source              = "./modules/01_VPC/"
    cidr_block          = var.cidr_block
    public_subnet_cidr   = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    availability_zone   = var.availability_zone
}


module "alb_sg" {
    source              = "./modules/02_SECURITY_GROUP/"
    vpc_id              = module.vpc.vpc_id
    sg_name             = var.alb_sg_name
    sg_ports            = var.alb_sg_ports
}


module "web_sg" {
    source              = "./modules/02_SECURITY_GROUP/"
    vpc_id              = module.vpc.vpc_id
    sg_name             = var.web_sg_name
    sg_ports            = var.web_sg_ports
}

module "app_sg" {
   source              = "./modules/02_SECURITY_GROUP/"
    vpc_id              = module.vpc.vpc_id
    sg_name             = var.app_sg_name
    sg_ports            = var.app_sg_ports
}

module "rds_sg" {
    source              = "./modules/02_SECURITY_GROUP/"
    vpc_id              = module.vpc.vpc_id
    sg_name             = var.rds_sg_name
    sg_ports            = var.rds_sg_ports
}



#ALB
module "alb"{
    source  = "./modules/03_ALB/"
    lb_name = var.lb_name
    lb_type = var.lb_type
    lb_security_groups = [module.alb_sg.security_group_id]
    lb_subnets = module.vpc.vpc_public_subnet_ids
}


#EC2

module "ssh_key" {
   source  = "./modules/07_SSH_KEY"
   ssh_key_name = var.ssh_key_name
   ssh_key_path = var.ssh_key_path
}

module "web_ec2"{
    source  = "./modules/06_EC2/"
    ami_id  = var.ami_id
    instance_type = var.instance_type
    key_name = module.ssh_key.ssh_key_name
    security_groups_name = module.web_sg.security_group_id
    subnet_id = module.vpc.vpc_private_subnet_ids[0]
}

module "app_ec2"{
    source  = "./modules/06_EC2/"
    ami_id  = var.ami_id
    instance_type = var.instance_type
    key_name = module.ssh_key.ssh_key_name
    security_groups_name = module.app_sg.security_group_id
    subnet_id = module.vpc.vpc_private_subnet_ids[1]
}


module "rds"{
    source  = "./modules/04_RDS/"
    rds_storage_size = var.rds_storage_size
    rds_name = var.rds_name
    rds_type = var.rds_type
    username = var.username
    rds_sg_ids = [module.rds_sg.security_group_id]
    }


module "s3"{
    source  = "./modules/05_S3"
    bucket_name = var.bucket_name
}