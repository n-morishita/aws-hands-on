resource "aws_lambda_function" "main" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = var.function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = "main.handler" # src/lambda/main.py の handler 関数
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.12"
  timeout          = 30
  memory_size      = 128

  depends_on = [
    aws_cloudwatch_log_group.lambda,
    aws_iam_role_policy_attachment.lambda_basic_logs
  ]
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.root}/modules/src/lambda"
  output_path = "${path.module}/build/lambda.zip"
}
