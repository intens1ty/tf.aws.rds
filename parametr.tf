resource "aws_db_parameter_group" "parametergroup" {
  name   = "parametergroup"
  family = "postgres12"
}