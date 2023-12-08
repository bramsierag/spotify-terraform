locals {
  items = yamldecode(file("./playlist.yml")).songs.search
}

data "spotify_search_track" "by_artist" {
  for_each = toset(local.items)
  name     = each.key
  limit    = "1"
}

locals {
  tracks = flatten([for items in data.spotify_search_track.by_artist : items.tracks ])
  track_ids = [for tracks in local.tracks : tracks.id]
  track_names = [for tracks in local.tracks : tracks.name]
}

resource "spotify_playlist" "playlist" {
  name        = "Terraform Platform Engineers"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = local.track_ids
}

output "playlist_url" {
  value       = "https://open.spotify.com/playlist/${spotify_playlist.playlist.id}"
  description = "Visit this URL in your browser to listen to the playlist"
}

 output "playlist_songs" {
   value = local.track_names
}
