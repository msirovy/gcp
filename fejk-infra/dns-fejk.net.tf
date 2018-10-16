resource "google_dns_managed_zone" "fejk-net" {
    name        = "fejk-net"
    dns_name    = "fejk.net."
    description = "Main company zone"

    labels = {
        env     = "production",
        project = "fejk-infra"
    }

}

# terraform import google_dns_record_set._txt fejk-net/fejk.net./TXT
resource "google_dns_record_set" "_txt" {
  name = "fejk.net."
  managed_zone = "${google_dns_managed_zone.fejk-net.name}"
  type = "TXT"
  ttl  = 300
  rrdatas = ["google-site-verification=zEiHj275ghBbbqTT2cOvFoTYmADlqZj6JeCRks9X6uU"]
}

# terraform import google_dns_record_set.tia_a fejk-net/tia.fejk.net./A
resource "google_dns_record_set" "tia_a" {
  name = "tia.fejk.net."
  managed_zone = "${google_dns_managed_zone.fejk-net.name}"
  type = "A"
  ttl  = 300
  rrdatas = ["37.205.8.193"]
}

# terraform import google_dns_record_set.athena_a fejk-net/athena.fejk.net./A
resource "google_dns_record_set" "athena_a" {
  name = "athena.fejk.net."
  managed_zone = "${google_dns_managed_zone.fejk-net.name}"
  type = "A"
  ttl  = 300
  rrdatas = ["37.157.192.91"]
}

