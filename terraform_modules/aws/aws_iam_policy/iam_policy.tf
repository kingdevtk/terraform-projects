module "iam-policy" {
  source  = "cloudposse/iam-policy/aws"
  version = "0.4.0"
  #https://registry.terraform.io/modules/cloudposse/iam-policy/aws/latest

  name = var.app_name

  iam_policy_enabled    = true
  description           = var.iam_policy_description
  iam_policy_statements = var.iam_policy_statements
  tags                  = var.loupe_tags

  context = module.this.context
}
