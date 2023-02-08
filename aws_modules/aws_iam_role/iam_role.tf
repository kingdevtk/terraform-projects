module "iam-role" {
  source  = "cloudposse/iam-role/aws"
  version = "0.16.2"
  #https://registry.terraform.io/modules/cloudposse/iam-role/aws/0.16.2

  name = var.app_name

  enabled               = true
  role_description      = var.iam_role_description
  policy_document_count = 0
  managed_policy_arns   = var.aws_managed_policy_arns
  principals            = var.iam_role_principals
  tags                  = var.kingdevtk_tags

  context = module.this.context
}
