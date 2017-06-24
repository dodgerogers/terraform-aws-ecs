/* Consume common outputs */
variable "aws_region" {}
variable "secret_key" {}
variable "access_key" {}
variable "sg_webapp_elbs_id" {}
variable "sg_webapp_instances_id" {}
variable "subnet_ids" {}
variable "name_prefix" {}
variable "ecs_instance_profile" {}
variable "ecs_service_role" {}

/* Webapp container variables */
variable "db_name" {}
variable "db_host" {}
variable "db_password" {}
variable "db_user" {}
variable "app_host" {}
variable "app_port" {}
variable "secret_key_base" {}

/* Region settings for AWS provider */
provider "aws" {
    region = "${var.aws_region}"
    secret_key = "${var.secret_key}"
    access_key = "${var.access_key}"
}

/* ECS optimized AMIs per region */
variable "ecs_image_id" {
  default = {
    "us-east-2" =	"ami-9f9cbafa"
    "us-east-1" =	"ami-83af8395"
    "us-west-2" =	"ami-11120768"
    "us-west-1" =	"ami-c1c6eba1"
    "eu-west-2" =	"ami-767e6812"
    "eu-west-1" =	"ami-5f140c39"
    "eu-central-1" = "ami-e656f189"
    "ap-northeast-1" = "ami-fd10059a"
    "ap-southeast-2" = "ami-6b6c7c08"
    "ap-southeast-1" = "ami-1926ab7a"
    "ca-central-1" = "ami-ead8678e"
  }
}

variable "webapp_docker_image_name" {
    default = ""
    description = "Docker image from Docker Hub"
}

variable "webapp_docker_image_tag" {
    default = ""
    description = "Docker image version to pull (from tag)"
}

variable "count_webapp" {
    default = 2
    description = "Number of webapp tasks to run"
}

variable "desired_capacity_on_demand" {
    default = 2
    description = "Number of instance to run"
}

variable "ec2_key_name" {
    default = ""
    description = "EC2 key name to SSH to the instance, make sure that you have this key if you want to access your instance via SSH"
}

variable "instance_type" {
    default = "t2.micro"
    description = "EC2 instance type to use"
}

variable "minimum_healthy_percent_webapp" {
    default = 50
    description = "ECS minimum_healthy_percent configuration, set it lower than 100 to allow rolling update without adding new instances"
}
