# Administrators
resource "aws_iam_group" "administrator" {
  name = "cloud_administrators"
  path = "/"
}

data "aws_iam_policy" "administrator_access" {
  name = "AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "administrator" {
  group      = aws_iam_group.administrator.name
  policy_arn = data.aws_iam_policy.administrator_access.arn
}

resource "aws_iam_user" "administrator" {
  count = length(var.administrator)
  name  = element(var.administrator, count.index)
}

resource "aws_iam_user_group_membership" "administrator" {
  count = length(var.administrator)
  user  = aws_iam_user.administrator[count.index].name
  groups = [
    aws_iam_group.administrator.name

  ]
}
 
resource "aws_iam_user_login_profile" "administrator" {
  count = length(var.administrator)
  user  = aws_iam_user.administrator[count.index].name
  # password_reset_required = true
}

# Developers

resource "aws_iam_group" "developer" {
  name = "developers"
  path = "/"
}

data "aws_iam_policy" "developer_access" {
  count =length(var.developer_policies)
  name = element(var.developer_policies, count.index)
}

resource "aws_iam_group_policy_attachment" "developer" {
  count      = "${length(var.developer_policies)}"
  group      = aws_iam_group.developer.name
  policy_arn = data.aws_iam_policy.developer_access[count.index].arn
}

resource "aws_iam_user" "developer" {
  count = length(var.developer)
  name  = element(var.developer, count.index)
}

resource "aws_iam_user_group_membership" "developer" {
  count = length(var.developer)
  user  = aws_iam_user.developer[count.index].name
  groups = [
    aws_iam_group.developer.name
  ]
}

resource "aws_iam_user_login_profile" "developer" {
  count = length(var.developer)
  user  = aws_iam_user.developer[count.index].name
  # password_reset_required = true
}




/* resource "aws_iam_group_policy" "developer_policy" {
  name  = "developer_policy"
  group = aws_iam_group.administrator.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
} */