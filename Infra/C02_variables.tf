variable "AWS_REGION" { 
  default = "us-east-1"
}

variable "ACCOUNT_id" { 
  default = "039865465269"
}


#VPC Related Variables
variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\""
}

variable "cidr" {
  description = "The CIDR block for the VPC."
}

variable "public_subnets" {
  description = "List of public subnets"
}

variable "private_subnets" {
  description = "List of private subnets"
}

variable "availability_zones" {
  description = "List of availability zones"
}




variable "service_desired_count" {
  description = "Number of tasks running in parallel"
  default     = 2
}


variable "container_port" {
  description = "Container Port"
}




variable "subnets" {
  description = "Subnets List"
}



