require 'spotify_client'

class SpotifyClient
  attr_reader :client

  def initialize
    @client = Spotify::Client.new
  end

  def search_track
    # client.search(:track. 'pulling teeth')
    # fetch('items')[1].fetch('id')
  end
end
