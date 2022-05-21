terraform {
    backend "s3" {
        bucket = "terraform"
        endpoint = "https://a0e9a519a696e7d8c04087b2ea84dfba.r2.cloudflarestorage.com"
        key = "prod/terraform.tfstate"
        region = "auto"
        force_path_style = true
        skip_credentials_validation = true
        skip_metadata_api_check = true
        skip_region_validation = true
    }
}
