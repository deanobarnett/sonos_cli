require 'sonos'

class SonosClient
  attr_reader :speaker

  def initialize
    @speaker = Sonos::System.new.speakers.first
  end

  def playing
    {
      artist: get(:artist),
      title: get(:title),
      album: get(:album)
    }
  end

  private

  def get(thing)
    speaker.now_playing.fetch(thing, 'n/a')
  end
end

