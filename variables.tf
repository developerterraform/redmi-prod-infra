variable "region" {
  description = "Region of the VM"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}
variable "project_name" {
  description = "name of project"
  type        = string
  default     = "redmi-project"
}
variable "project_env" {
  description = "project_environment"
  type        = string
  default     = "prod"
}
variable "project_owner" {
  description = "project_environment"
  type        = string
  default     = "RMP"
}
variable "ami_id" {
  description = "project_ami"
  type        = string
  default     = "ami-02e94b011299ef128"
}


