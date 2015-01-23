require 'sonos'

class SonosClient
  def initialize
    @speaker = Sonos::System.new.speakers.first
  end

  def track(id)
    # @speaker.add_to_queue "x-sonos-spotify:spotify%3atrack%3a#{id}"
    @speaker.add_spotify_to_queue(id: id)
    true
  end

  def play
    @speaker.play(last_track_uri)
  end

  def playing
    {
      artist: get(:artist),
      title: get(:title),
      album: get(:album)
    }
  end

  private

  def last_track_uri
    @speaker.queue[:items].last[:queue_id]
  end

  def get(thing)
    @speaker.now_playing.fetch(thing, 'n/a')
  end
end

