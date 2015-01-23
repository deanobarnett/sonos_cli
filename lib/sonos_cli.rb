module SonosCli
  require_relative 'sonos_cli/version'
  require 'sonos'
  require 'awesome_print'
  require 'thor'

  class Cli < Thor
    desc 'playing', 'Print the currently playing song'
    def playing
      ap DoSonos.new.playing
    end
  end

  class DoSonos
    attr_reader :song

    def initialize
      speaker = Sonos::System.new.speakers.first
      @song = speaker.now_playing
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
      song.fetch(thing, 'n/a')
    end
  end
end
