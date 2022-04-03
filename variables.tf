variable "region" {
  description = "Define AWS region"
  type = string
}

variable "access_key" {
    description = "AWS Access Key Value"
    type = string
}

variable "secret_access_key" {
  description = "AWS Secret Access Key"
  type = string
}

variable "server_port" {
  description = "http web-server port"
  type = number
  default = 8080
}