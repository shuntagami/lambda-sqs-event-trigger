variable "tfenv" {
  type = string
}

variable "name" {
  description = "name of SQS"
  type        = string
}

variable "delay_seconds" {
  type    = number
  default = 90
}

variable "max_message_size" {
  type    = number
  default = 2048
}

variable "message_retention_seconds" {
  type    = number
  default = 86400
}

variable "receive_wait_time_seconds" {
  type    = number
  default = 10
}
