resource "cloudflare_zone" "oefd_net" {
    zone   = "oefd.net"
    paused = false
    plan   = "free"
    type   = "full"
}
