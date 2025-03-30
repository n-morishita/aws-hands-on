# SSM 用の IAM ロール
resource "aws_iam_role" "ssm_role" {
  name = "study-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# SSM 用の IAM ポリシーアタッチ
resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# EC2 インスタンスプロファイル
resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "study-ssm-instance-profile"
  role = aws_iam_role.ssm_role.name
}
