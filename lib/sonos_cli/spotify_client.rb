require 'spotify_client'

class SpotifyClient
  RESULT_SIZE = 5

  def initialize
    @client = Spotify::Client.new
  end

  def search_track(search_string)
    results_for(search_string).map do |result|
      {
        id: result.fetch('id'),
        artist: result.fetch('artists').first['name'],
        track: result.fetch('name')
      }
    end
  end

  private

  def results_for(search_string)
    @client.search(:track, search_string)
           .fetch('tracks')
           .fetch('items')
           .first(RESULT_SIZE)
  end
end
