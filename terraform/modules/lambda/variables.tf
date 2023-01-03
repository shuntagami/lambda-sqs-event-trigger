variable "tfenv" {
  type = string
}

variable "file_name" {
  description = "name of zip file to be deployed"
  type        = string
}

variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "handler" {
  description = "Binary file name in ZIP file"
  type        = string
}

variable "runtime" {
  type = string
}

variable "timeout" {
  type = number
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime"
  type        = number
  default     = 128 # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function#memory_size
}

variable "retention_in_days" {
  description = "retention_in_days for CloudWatch Log group"
  type        = number
  default     = 90
}

variable "description" {
  type    = string
  default = ""
}

variable "lambda_arn" {
  type = string
}

variable "sqs_trigger_config" {
  description = "Configuration for usign SQS event triggeer"
  type = object({
    sqs_arn = string
  })
  default = null
}

variable "env_vars" {
  description = "A map that defines environment variables for the Lambda Function"
  type        = map(string)
  default     = {}
}
