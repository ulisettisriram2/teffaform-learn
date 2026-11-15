resource "aws_route53_record" "r53_test" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.test[count.index].private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "r53_test_transport" {
    count = contains(var.instances,"Transport") ? 1 : 0
    zone_id = var.zone_id
    name = "${var.instances[count.index]}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = [aws_instance.test[count.index].public_ip]
    allow_overwrite = true
} 