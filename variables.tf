variable "gitlab_runner_name" {
  description = "instance type to use"
  type        = string
  default     = "mupando-gitlab-runner"
}

variable "instance_type" {
  description = "instance type to use"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "instance type to use"
  type        = string
  default     = "ami-008015da06c873b17"
}
