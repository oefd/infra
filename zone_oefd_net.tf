resource "cloudflare_zone" "oefd_net" {
    zone   = "oefd.net"
    paused = false
    plan   = "free"
    type   = "full"
}

#######
## apex
resource "cloudflare_record" "oefd_net_apex_a" {
    zone_id = cloudflare_zone.oefd_net.id
    type = "A"
    name = "oefd.net"
    value = "8.8.8.8"
    proxied = true
}
resource "cloudflare_record" "oefd_net_apex_aaaa" {
    zone_id = cloudflare_zone.oefd_net.id
    type = "AAAA"
    name = "oefd.net"
    value = "2002::"
    proxied = true
}
resource "cloudflare_record" "oefd_net_www" {
    zone_id = cloudflare_zone.oefd_net.id
    type = "CNAME"
    name = "www"
    value = "oefd.net"
    proxied = true
}

########
## email
resource "cloudflare_record" "oefd_net_email_mx" {
    zone_id = cloudflare_zone.oefd_net.id
    type = "MX"
    name = "oefd.net"
    value = "mail.tutanota.de"
    ttl = 14400
    priority = 10
}
resource "cloudflare_record" "oefd_net_email_dmarc" {
    zone_id = cloudflare_zone.oefd_net.id
    type = "TXT"
    name = "_dmarc"
    value = "v=DMARC1; p=quarantine; adkim=s"
    ttl = 14400
}
resource "cloudflare_record" "oefd_net_email_spf" {
    zone_id = cloudflare_zone.oefd_net.id
    type = "TXT"
    name = "oefd.net"
    value = "v=spf1 include:spf.tutanota.de -all"
    ttl = 14400
}
resource "cloudflare_record" "oefd_net_email_verify" {
    zone_id = cloudflare_zone.oefd_net.id
    type = "TXT"
    name = "oefd.net"
    value = "t-verify=02b7fd72d03f182f58988d688d966aa5"
    ttl = 14400
}
resource "cloudflare_record" "oefd_net_email_s1" {
    zone_id = cloudflare_zone.oefd_net.id
    type = "CNAME"
    name = "s1._domainkey"
    value = "s1.domainkey.tutanota.de"
    ttl = 14400
}
resource "cloudflare_record" "oefd_net_email_s2" {
    zone_id = cloudflare_zone.oefd_net.id
    type = "CNAME"
    name = "s2._domainkey"
    value = "s2.domainkey.tutanota.de"
    ttl = 14400
}
resource "cloudflare_record" "oefd_net_email_mta_sts" {
    zone_id = cloudflare_zone.oefd_net.id
    type = "CNAME"
    name = "mta-sts"
    value = "mta-sts.tutanota.de"
    ttl = 14400
}
resource "cloudflare_record" "oefd_net_email_mta_sts_" {
    zone_id = cloudflare_zone.oefd_net.id
    type = "CNAME"
    name = "_mta-sts"
    value = "mta-sts.tutanota.de"
    ttl = 14400
}
