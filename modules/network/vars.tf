variable "secret_key" {}
variable "access_key" {}
variable "name_prefix" {
    default = "teebox"
    description = "Name prefix for this environment."
}

variable "aws_region" {
    default = "us-east-1"
    description = "Determine AWS region endpoint to access."
}

/**
  * NOTE: Different AWS account may have different availability zones.
  */
variable "subnet_azs" {
    description = "Subnet AZ, separated by comma. Default is \"a,b\". Please check your available AZ before specifying this value."
    default = "a,b"
}

/* Region settings for AWS provider */
provider "aws" {
    region = "${var.aws_region}"
    secret_key = "${var.secret_key}"
    access_key = "${var.access_key}"
}
