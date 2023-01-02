/*====
Lambda function
======*/
resource "aws_lambda_function" "lambda_function" {
  filename      = var.file_name
  function_name = var.function_name
  role          = var.lambda_arn
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout
  memory_size   = var.memory_size

  description = var.description

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = base64sha256(file("${path.root}/lambda_function_payload.zip"))
  source_code_hash = filebase64sha256(var.file_name)

  tags = {
    cost = "lambda-sqs-event-trigger-${var.tfenv}"
  }
}

/*====
CloudWatch Log group
======*/
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.retention_in_days
}

resource "aws_lambda_event_source_mapping" "example" {
  count = var.sqs_trigger_config == null ? 0 : 1

  event_source_arn = var.sqs_trigger_config.sqs_arn
  function_name    = aws_lambda_function.lambda_function.arn
}
