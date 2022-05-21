resource "cloudflare_zone" "xnr_ca" {
    zone   = "xnr.ca"
    paused = false
    plan   = "free"
    type   = "full"
}

#######
## apex
resource "cloudflare_record" "xnr_ca_apex_a" {
    zone_id = cloudflare_zone.xnr_ca.id
    type = "A"
    name = "xnr.ca"
    value = "8.8.8.8"
    proxied = true
}
resource "cloudflare_record" "xnr_ca_apex_aaaa" {
    zone_id = cloudflare_zone.xnr_ca.id
    type = "AAAA"
    name = "xnr.ca"
    value = "2002::"
    proxied = true
}
resource "cloudflare_record" "xnr_ca_www" {
    zone_id = cloudflare_zone.xnr_ca.id
    type = "CNAME"
    name = "www"
    value = "xnr.ca"
    proxied = true
}

########
## email
resource "cloudflare_record" "xnr_ca_email_mx" {
    zone_id = cloudflare_zone.xnr_ca.id
    type = "MX"
    name = "xnr.ca"
    value = "mail.tutanota.de"
    ttl = 14400
    priority = 10
}
resource "cloudflare_record" "xnr_ca_email_dmarc" {
    zone_id = cloudflare_zone.xnr_ca.id
    type = "TXT"
    name = "_dmarc"
    value = "v=DMARC1; p=quarantine; adkim=s"
    ttl = 14400
}
resource "cloudflare_record" "xnr_ca_email_spf" {
    zone_id = cloudflare_zone.xnr_ca.id
    type = "TXT"
    name = "xnr.ca"
    value = "v=spf1 include:spf.tutanota.de -all"
    ttl = 14400
}
resource "cloudflare_record" "xnr_ca_email_verify" {
    zone_id = cloudflare_zone.xnr_ca.id
    type = "TXT"
    name = "xnr.ca"
    value = "t-verify=28ee63f1e3d144678843281f3ddb54e0"
    ttl = 14400
}
resource "cloudflare_record" "xnr_ca_email_s1" {
    zone_id = cloudflare_zone.xnr_ca.id
    type = "CNAME"
    name = "s1._domainkey"
    value = "s1.domainkey.tutanota.de"
    ttl = 14400
}
resource "cloudflare_record" "xnr_ca_email_s2" {
    zone_id = cloudflare_zone.xnr_ca.id
    type = "CNAME"
    name = "s2._domainkey"
    value = "s2.domainkey.tutanota.de"
    ttl = 14400
}
resource "cloudflare_record" "xnr_ca_email_mta_sts" {
    zone_id = cloudflare_zone.xnr_ca.id
    type = "CNAME"
    name = "mta-sts"
    value = "mta-sts.tutanota.de"
    ttl = 14400
}
resource "cloudflare_record" "xnr_ca_email_mta_sts_" {
    zone_id = cloudflare_zone.xnr_ca.id
    type = "CNAME"
    name = "_mta-sts"
    value = "mta-sts.tutanota.de"
    ttl = 14400
}
