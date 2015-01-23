module SonosCli
  require_relative 'sonos_cli/version'
  require_relative 'sonos_cli/sonos_client'
  require_relative 'sonos_cli/spotify_client'
  require 'awesome_print'
  require 'thor'

  class Cli < Thor
    desc 'playing', 'Print the currently playing song'
    def playing
      ap SonosClient.new.playing
    end

    desc 'play track', 'play track'
    def track
      # track = SpotifyClient.search_track(track)
      # SonosClient.play track
    end
  end
end
