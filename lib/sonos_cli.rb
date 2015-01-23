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

    desc 'track TRACK_NAME', 'play track from spotify'
    def track(search_string)
      search_results = SpotifyClient.new.search_track(search_string)
      output = ['Which of these tracks would you like to play?']
      output.push(track_choices(search_results)).flatten
      output.push('')

      option = ask(output.join("\n"), limited_to: ('1'..'5').to_a)

      sonos_client.track(search_results[option.to_i - 1].fetch(:id))
      sonos_client.play
    end

    private

    def sonos_client
      SonosClient.new
    end

    def track_choices(tracks)
      tracks.map.with_index(1) do |track, index|
        "[#{set_color(index, :green)}] #{set_color(track[:artist], :cyan)} - #{set_color(track[:track], :cyan)}"
      end
    end
  end
end
