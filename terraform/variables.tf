variable "TFENV_NAME" {
  type = string
}

variable "AWS_PROFILE" {
  type = string
}

variable "AWS_DEFAULT_REGION" {
  type    = string
  default = "ap-northeast-1"
}

variable "S3_BUCKET_NAME" {
  type = string
}

variable "SLACK_CHANNEL_ID" {
  type = string
}
