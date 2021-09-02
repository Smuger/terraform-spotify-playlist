terraform {
  required_providers {
    spotify = {
      source  = "conradludgate/spotify"
      version = "~> 0.2.0"
    }
  }
}

variable "spotify_api_key" {
  type = string
}

provider "spotify" {
  api_key = var.spotify_api_key
}

resource "spotify_playlist" "playlist" {
  name        = "Creatively Named Terraform Summer Playlist"
  description = "Few songs are even good."
  public      = true

  tracks = flatten([
    data.spotify_track.up_around_the_bend.id,
    data.spotify_track.she_loves_you.id,
    data.spotify_track.i_m_a_believer.id,
    data.spotify_track.surfin_u_s_a.id,
    data.spotify_track.crazy.id,
    data.spotify_track.good_vibrations.id,
    data.spotify_track.come_and_get_your_love.id,
    data.spotify_track._1979.id,
    data.spotify_track.happy_together.id,
    data.spotify_track.sunny.id,
    data.spotify_track.sweet_caroline.id,
    data.spotify_track.california_dreamin.id,
    data.spotify_track.here_comes_the_sun.id,
    data.spotify_track.everybodys_talkin.id,
  ])
}

data "spotify_track" "up_around_the_bend" {
  spotify_id = "2yVgB9jAOHncthn5HEQoee"
}

data "spotify_track" "she_loves_you" {
  spotify_id = "6nEkxYIEnrbYH7h1hJ8Xn6"
}

data "spotify_track" "i_m_a_believer" {
  spotify_id = "1K18Ko6iU0IRRok92J1OiM"
}

data "spotify_track" "surfin_u_s_a" {
  spotify_id = "0wz1LjDb9ZNEYwOmDJ3Q4b"
}

data "spotify_track" "crazy" {
  spotify_id = "0BtXtxmKBm1HwGnM3kO3rY"
}

data "spotify_track" "good_vibrations" {
  spotify_id = "5t9KYe0Fhd5cW6UYT4qP8f"
}

data "spotify_track" "come_and_get_your_love" {
  spotify_id = "7GVUmCP00eSsqc4tzj1sDD"
}

data "spotify_track" "_1979" {
  spotify_id = "5QLHGv0DfpeXLNFo7SFEy1"
}

data "spotify_track" "happy_together" {
  spotify_id = "1JO1xLtVc8mWhIoE3YaCL0"
}

data "spotify_track" "sunny" {
  spotify_id = "6IFSPx3lqkw0ri4OJkTkLl"
}

data "spotify_track" "sweet_caroline" {
  spotify_id = "62AuGbAkt8Ox2IrFFb8GKV"
}

data "spotify_track" "california_dreamin" {
  spotify_id = "4s6LhHAV5SEsOV0lC2tjvJ"
}

data "spotify_track" "here_comes_the_sun" {
  spotify_id = "45yEy5WJywhJ3sDI28ajTm"
}

data "spotify_track" "everybodys_talkin" {
  spotify_id = "1jcPcDu2YawPfLhwjYnqK2"
}

output "playlist_url" {
  value       = "https://open.spotify.com/playlist/${spotify_playlist.playlist.id}"
  description = "Visit this URL in your browser to listen to the playlist"
}
