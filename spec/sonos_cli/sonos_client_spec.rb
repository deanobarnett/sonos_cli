require 'spec_helper'

describe SonosClient do
  let(:speaker) { double('speaker') }

  before(:each) do
    Sonos::System.stub_chain(:new, :speakers, :first) { speaker }
  end

  describe '#playing' do
    let(:result) do
      {
        artist: 'an artist',
        title: 'a title',
        album: 'an album'
      }
    end

    before(:each) do
      allow(speaker).to receive(:now_playing) { result }
    end

    it 'returns artist' do
      expect(subject.playing[:artist]).to eq('an artist')
    end

    it 'returns title' do
      expect(subject.playing[:title]).to eq('a title')
    end

    it 'returns album' do
      expect(subject.playing[:album]).to eq('an album')
    end
  end
end
