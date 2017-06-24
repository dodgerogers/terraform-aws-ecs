# resource "aws_db_instance" "webapp_db" {
#   allocated_storage    = 10
#   storage_type         = "gp2"
#   engine               = "postgres"
#   engine_version       = "5.6.17"
#   instance_class       = "db.t1.micro"
#   name                 = "${var.name_prefix}_db"
#   username             = "foo"
#   password             = "bar"
#   db_subnet_group_name = "my_database_subnet_group"
#   parameter_group_name = "default.mysql5.6"
# }
