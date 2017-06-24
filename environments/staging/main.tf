##
# Setup terraform to backup state to S3
##
terraform {
  backend "s3" {
    bucket  = "teebox-eco-terraform"
    key     = "terraform/tfstate.staging"
    region  = "us-east-1"
    encrypt = "true"
  }
}

##
# Create IAM and roles
##
variable "secret_key" {}
variable "access_key" {}
variable "aws_region" {}
variable "name_prefix" {}

module "iam" {
  source = "../../modules/static/iam"

  secret_key = "${var.secret_key}"
  access_key = "${var.access_key}"
  aws_region = "${var.aws_region}"
  name_prefix = "${var.name_prefix}"
}

##
# Create VPC and security groups
##
variable "subnet_azs" {}

module "network" {
  source = "../../modules/network"

  secret_key = "${var.secret_key}"
  access_key = "${var.access_key}"
  aws_region = "${var.aws_region}"
  name_prefix = "${var.name_prefix}"
  subnet_azs = "${var.subnet_azs}"
}

##
# Create Autoscaling group and define container deploy task
##
variable "webapp_docker_image_name" {}
variable "webapp_docker_image_tag" {}
variable "db_name" {}
variable "db_host" {}
variable "db_password" {}
variable "db_user" {}
variable "app_host" {}
variable "app_port" {}
variable "secret_key_base" {}

module "auto_scaling_group" {
  source = "../../modules/asg"

  secret_key = "${var.secret_key}"
  access_key = "${var.access_key}"
  aws_region = "${var.aws_region}"
  name_prefix = "${var.name_prefix}"

  subnet_ids = "${module.network.vpc_subnet_ids}"
  ecs_service_role = "${module.iam.ecs_service_role}"
  ecs_instance_profile = "${module.iam.ecs_instance_profile}"
  sg_webapp_elbs_id = "${module.network.sg_webapp_elbs_id}"
  sg_webapp_instances_id = "${module.network.sg_webapp_instances_id}"

  webapp_docker_image_name = "${var.webapp_docker_image_name}"
  webapp_docker_image_tag = "${var.webapp_docker_image_tag}"

  db_name = "${var.db_name}"
  db_host = "${var.db_host}"
  db_user = "${var.db_user}"
  db_password = "${var.db_password}"

  app_host = "${var.app_host}"
  app_port = "${var.app_port}"
  secret_key_base = "${var.secret_key_base}"
}

output "webapp_docker_tag" {
  value = "${var.webapp_docker_image_name}:${var.webapp_docker_image_tag}"
}
output "elb_dns_name" {
  value = "${module.auto_scaling_group.elb_dns_name}"
}
