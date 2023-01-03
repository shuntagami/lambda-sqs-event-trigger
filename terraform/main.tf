/*====
SQS
======*/
module "sqs" {
  source = "./modules/sqs"

  tfenv = var.TFENV_NAME
  name  = "sqs_for_lambda_event_trigger"
}

/*====
IAM
======*/
data "aws_iam_policy_document" "s3" {
  statement {
    sid       = "AllowS3Permissio0ns"
    effect    = "Allow"
    resources = ["arn:aws:s3:::${var.S3_BUCKET}/*"]

    actions = [
      "s3:PutObject",
      "s3:GetObject"
    ]
  }
}

data "aws_iam_policy_document" "sqs" {
  statement {
    sid       = "AllowSQSPermissions"
    effect    = "Allow"
    resources = ["arn:aws:sqs:*"]

    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:ReceiveMessage"
    ]

  }
}

data "aws_iam_policy_document" "cloud_watch" {
  statement {
    sid       = "AllowCloudWatchLogPermissions"
    effect    = "Allow"
    resources = ["arn:aws:logs:*:*:*"]

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

  }
}

module "role" {
  source = "cloudposse/iam-role/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"

  assume_role_actions = ["sts:AssumeRole"]
  enabled             = true
  stage               = var.TFENV_NAME
  name                = "app"

  policy_description = "Allow access to S3 and SQS"
  role_description   = "IAM role with permissions to perform actions on S3 and SQS resources"

  policy_document_count = 3
  principals = {
    Service = ["lambda.amazonaws.com"]
  }

  policy_documents = [
    data.aws_iam_policy_document.s3.json,
    data.aws_iam_policy_document.sqs.json,
    data.aws_iam_policy_document.cloud_watch.json
  ]
}

/*====
Lambda function
======*/
module "lambda_sqs_event_trigger" {
  source = "./modules/lambda"

  tfenv         = var.TFENV_NAME
  description   = "lambda sqs event trigger"
  file_name     = "${path.root}/../dist/index.zip"
  function_name = "lambda_sqs_event_trigger"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  timeout       = 30
  lambda_arn    = module.role.arn
  sqs_trigger_config = {
    sqs_arn = module.sqs.arn
  }
}
