terraform {
  required_providers {
    spotify = {
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
  auth_server = var.spotify_auth_proxy_url
}