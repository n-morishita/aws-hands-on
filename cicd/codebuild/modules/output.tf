output "website_url" {
  value = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.website.bucket
}

output "codebuild_project_name" {
  value = aws_codebuild_project.website.name
}