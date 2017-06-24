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

/* Region settings for AWS provider */
provider "aws" {
    region = "${var.aws_region}"
    secret_key = "${var.secret_key}"
    access_key = "${var.access_key}"
}
