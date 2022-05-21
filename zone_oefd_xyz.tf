resource "cloudflare_zone" "oefd_xyz" {
    zone   = "oefd.xyz"
    paused = false
    plan   = "free"
    type   = "full"
}

#######
## apex
resource "cloudflare_record" "oefd_xyz_apex_a" {
    zone_id = cloudflare_zone.oefd_xyz.id
    type = "A"
    name = "oefd.xyz"
    value = "8.8.8.8"
    proxied = true
}
resource "cloudflare_record" "oefd_xyz_apex_aaaa" {
    zone_id = cloudflare_zone.oefd_xyz.id
    type = "AAAA"
    name = "oefd.xyz"
    value = "2002::"
    proxied = true
}
resource "cloudflare_record" "oefd_xyz_www" {
    zone_id = cloudflare_zone.oefd_xyz.id
    type = "CNAME"
    name = "www"
    value = "oefd.xyz"
    proxied = true
}

########
## email
resource "cloudflare_record" "oefd_xyz_email_mx" {
    zone_id = cloudflare_zone.oefd_xyz.id
    type = "MX"
    name = "oefd.xyz"
    value = "mail.tutanota.de"
    ttl = 14400
    priority = 10
}
resource "cloudflare_record" "oefd_xyz_email_dmarc" {
    zone_id = cloudflare_zone.oefd_xyz.id
    type = "TXT"
    name = "_dmarc"
    value = "v=DMARC1; p=quarantine; adkim=s"
    ttl = 14400
}
resource "cloudflare_record" "oefd_xyz_email_spf" {
    zone_id = cloudflare_zone.oefd_xyz.id
    type = "TXT"
    name = "oefd.xyz"
    value = "v=spf1 include:spf.tutanota.de -all"
    ttl = 14400
}
resource "cloudflare_record" "oefd_xyz_email_verify" {
    zone_id = cloudflare_zone.oefd_xyz.id
    type = "TXT"
    name = "oefd.xyz"
    value = "t-verify=5381ef9bec42489972ebddd8004f7ad6"
    ttl = 14400
}
resource "cloudflare_record" "oefd_xyz_email_s1" {
    zone_id = cloudflare_zone.oefd_xyz.id
    type = "CNAME"
    name = "s1._domainkey"
    value = "s1.domainkey.tutanota.de"
    ttl = 14400
}
resource "cloudflare_record" "oefd_xyz_email_s2" {
    zone_id = cloudflare_zone.oefd_xyz.id
    type = "CNAME"
    name = "s2._domainkey"
    value = "s2.domainkey.tutanota.de"
    ttl = 14400
}
resource "cloudflare_record" "oefd_xyz_email_mta_sts" {
    zone_id = cloudflare_zone.oefd_xyz.id
    type = "CNAME"
    name = "mta-sts"
    value = "mta-sts.tutanota.de"
    ttl = 14400
}
resource "cloudflare_record" "oefd_xyz_email_mta_sts_" {
    zone_id = cloudflare_zone.oefd_xyz.id
    type = "CNAME"
    name = "_mta-sts"
    value = "mta-sts.tutanota.de"
    ttl = 14400
}
