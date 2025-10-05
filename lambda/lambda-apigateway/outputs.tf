output "api_gateway_url" {
  description = "API Gateway URL"
  value       = module.lambda_function.api_gateway_url
}

output "lambda_function_name" {
  description = "Lambda function name"
  value       = module.lambda_function.function_name
}

output "function_arn" {
  description = "Lambda function ARN"
  value       = module.lambda_function.function_arn
}
