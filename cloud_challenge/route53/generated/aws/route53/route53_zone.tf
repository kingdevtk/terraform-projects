resource "aws_route53_zone" "tfer--Z03412111SKDXP1DHG5AP_trinatking-002E-com" {
  comment       = "HostedZone created by Route53 Registrar"
  force_destroy = "false"
  name          = "trinatking.com"
}

resource "aws_route53_zone" "tfer--Z064000611SQH1FUMQRAZ_ablackladytechshow-002E-com" {
  comment       = "HostedZone created by Route53 Registrar"
  force_destroy = "false"
  name          = "ablackladytechshow.com"
}

resource "aws_route53_zone" "tfer--Z067254110X861QJ0ZUWL_ablackladytechblog-002E-com" {
  comment       = "HostedZone created by Route53 Registrar"
  force_destroy = "false"
  name          = "ablackladytechblog.com"
}
