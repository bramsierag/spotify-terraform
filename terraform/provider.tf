terraform {
  required_providers {
    spotify = {
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.SPOTIFY_API_KEY
  auth_server = var.SPOTIFY_AUTH_PROXY_URL
}