resource "aws_route53_record" "tfer--Z03412111SKDXP1DHG5AP__8f4a1e119107f5ad7115c5e171ab3d7d-002E-trinatking-002E-com-002E-_CNAME_" {
  name    = "_8f4a1e119107f5ad7115c5e171ab3d7d.trinatking.com"
  records = ["_f0054f6ff976a56aeb7fb822d15bfa6a.yqdvztwmqr.acm-validations.aws."]
  ttl     = "300"
  type    = "CNAME"
  zone_id = "${aws_route53_zone.tfer--Z03412111SKDXP1DHG5AP_trinatking-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z03412111SKDXP1DHG5AP__c095b7e078a549af6bb1e7a3e42cfb1e-002E-www-002E-trinatking-002E-com-002E-_CNAME_" {
  name    = "_c095b7e078a549af6bb1e7a3e42cfb1e.www.trinatking.com"
  records = ["_51627e9325d0c36c5dbd8ea50bfa5bbc.yqdvztwmqr.acm-validations.aws."]
  ttl     = "300"
  type    = "CNAME"
  zone_id = "${aws_route53_zone.tfer--Z03412111SKDXP1DHG5AP_trinatking-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z03412111SKDXP1DHG5AP_trinatking-002E-com-002E-_A_" {
  alias {
    evaluate_target_health = "false"
    name                   = "d1o75q5exq6z0v.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }

  name    = "trinatking.com"
  type    = "A"
  zone_id = "${aws_route53_zone.tfer--Z03412111SKDXP1DHG5AP_trinatking-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z03412111SKDXP1DHG5AP_trinatking-002E-com-002E-_NS_" {
  name    = "trinatking.com"
  records = ["ns-1344.awsdns-40.org.", "ns-1786.awsdns-31.co.uk.", "ns-409.awsdns-51.com.", "ns-588.awsdns-09.net."]
  ttl     = "172800"
  type    = "NS"
  zone_id = "${aws_route53_zone.tfer--Z03412111SKDXP1DHG5AP_trinatking-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z03412111SKDXP1DHG5AP_trinatking-002E-com-002E-_SOA_" {
  name    = "trinatking.com"
  records = ["ns-409.awsdns-51.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl     = "900"
  type    = "SOA"
  zone_id = "${aws_route53_zone.tfer--Z03412111SKDXP1DHG5AP_trinatking-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z03412111SKDXP1DHG5AP_www-002E-trinatking-002E-com-002E-_A_" {
  alias {
    evaluate_target_health = "false"
    name                   = "d1o75q5exq6z0v.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }

  name    = "www.trinatking.com"
  type    = "A"
  zone_id = "${aws_route53_zone.tfer--Z03412111SKDXP1DHG5AP_trinatking-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z064000611SQH1FUMQRAZ_ablackladytechshow-002E-com-002E-_NS_" {
  name    = "ablackladytechshow.com"
  records = ["ns-1194.awsdns-21.org.", "ns-1700.awsdns-20.co.uk.", "ns-454.awsdns-56.com.", "ns-607.awsdns-11.net."]
  ttl     = "172800"
  type    = "NS"
  zone_id = "${aws_route53_zone.tfer--Z064000611SQH1FUMQRAZ_ablackladytechshow-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z064000611SQH1FUMQRAZ_ablackladytechshow-002E-com-002E-_SOA_" {
  name    = "ablackladytechshow.com"
  records = ["ns-607.awsdns-11.net. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl     = "900"
  type    = "SOA"
  zone_id = "${aws_route53_zone.tfer--Z064000611SQH1FUMQRAZ_ablackladytechshow-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z067254110X861QJ0ZUWL_ablackladytechblog-002E-com-002E-_NS_" {
  name    = "ablackladytechblog.com"
  records = ["ns-1315.awsdns-36.org.", "ns-2025.awsdns-61.co.uk.", "ns-3.awsdns-00.com.", "ns-752.awsdns-30.net."]
  ttl     = "172800"
  type    = "NS"
  zone_id = "${aws_route53_zone.tfer--Z067254110X861QJ0ZUWL_ablackladytechblog-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z067254110X861QJ0ZUWL_ablackladytechblog-002E-com-002E-_SOA_" {
  name    = "ablackladytechblog.com"
  records = ["ns-3.awsdns-00.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl     = "900"
  type    = "SOA"
  zone_id = "${aws_route53_zone.tfer--Z067254110X861QJ0ZUWL_ablackladytechblog-002E-com.zone_id}"
}
