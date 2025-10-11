resource "aws_codebuild_project" "website" {
  name         = "website-builder"
  description  = "Build project for sample static website"
  service_role = aws_iam_role.codebuild.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "S3_BUCKET"
      value = aws_s3_bucket.website.bucket
    }
  }

  source {
    type      = "NO_SOURCE"
    buildspec = file("${path.module}/ci/buildspec.yml")
  }
}

resource "null_resource" "initial_build" {
  triggers = {
    project = aws_codebuild_project.website.id
  }

  provisioner "local-exec" {
    command = "aws codebuild start-build --project-name ${aws_codebuild_project.website.name}"
  }

  depends_on = [
    aws_codebuild_project.website,
    aws_s3_bucket_website_configuration.website,
    aws_s3_bucket_policy.website
  ]
}
