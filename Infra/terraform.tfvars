name = "demo"
environment = "test"
cidr = "10.0.0.0/16"

private_subnets     = ["10.0.0.0/20", "10.0.32.0/20", "10.0.64.0/20"]
public_subnets      = ["10.0.16.0/20", "10.0.48.0/20", "10.0.80.0/20"]

availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
service_desired_count = 2
container_port = 80
subnets = ["10.0.10.0/20", "10.0.11.0/20","10.0.20.0/20", "10.0.21.0/20"]