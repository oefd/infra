resource "cloudflare_zone" "oefd_cloud" {
    zone   = "oefd.cloud"
    paused = false
    plan   = "free"
    type   = "full"
}

#######
## apex
resource "cloudflare_record" "oefd_cloud_apex_a" {
    zone_id = cloudflare_zone.oefd_cloud.id
    type = "A"
    name = "oefd.cloud"
    value = "8.8.8.8"
    proxied = true
}
resource "cloudflare_record" "oefd_cloud_apex_aaaa" {
    zone_id = cloudflare_zone.oefd_cloud.id
    type = "AAAA"
    name = "oefd.cloud"
    value = "2002::"
    proxied = true
}
resource "cloudflare_record" "oefd_cloud_www" {
    zone_id = cloudflare_zone.oefd_cloud.id
    type = "CNAME"
    name = "www"
    value = "oefd.cloud"
    proxied = true
}
