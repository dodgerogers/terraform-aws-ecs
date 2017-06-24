name_prefix = "teebox"
aws_region = "us-east-1"
subnet_azs = "a,b"

count_webapp = 2
desired_capacity_on_demand = 2
ec2_key_name = "teebox-staging"
instance_type = "t2.micro"
minimum_healthy_percent_webapp = 50

webapp_docker_image_name = "377092858912.dkr.ecr.us-east-1.amazonaws.com/teebox.io"
webapp_docker_image_tag = "0.0.2.12-ed04e23904"
