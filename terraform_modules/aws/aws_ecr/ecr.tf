module "ecr" {
  source  = "cloudposse/ecr/aws"
  version = "0.34.0"
  #https://registry.terraform.io/modules/cloudposse/ecr/aws/0.34.0

  name = var.app_name

  encryption_configuration = ({
    encryption_type = "KMS"
    kms_key         = null
  })
  image_tag_mutability    = var.image_tag_mutability
  scan_images_on_push     = true
  enable_lifecycle_policy = true
  tags                    = var.kingdevtk_tags

  context = module.this.context
}
