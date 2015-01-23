require 'spec_helper'
require_relative '../data/spotify_result'

describe SpotifyClient do
  include SpotifyResult

  describe '#search_track' do
    let(:mock_client) { double('mock client') }

    before(:each) do
      allow(Spotify::Client).to receive(:new) { mock_client }
      allow(mock_client).to receive(:search).with(:track, 'pulling teeth') { SpotifyResult::RESULT }
    end

    it 'searches spotify' do
      subject.search_track('pulling teeth')
      expect(mock_client).to have_received(:search).with(:track, 'pulling teeth')
    end

    it 'returns Green Day as artist' do
      expect(subject.search_track('pulling teeth')[1][:artist]).to eq('Green Day')
    end

    it 'returns Pulling Teeth' do
      expect(subject.search_track('pulling teeth')[1][:track]).to eq('Pulling Teeth')
    end

    it 'returns the spotify id' do
      expect(subject.search_track('pulling teeth')[1][:id]).to eq('5z2XqieaqxpCJc3ntZ6Ye3')
    end

    it 'returns the top 5 tracks for search string' do
      expect(subject.search_track('pulling teeth').size).to eq 5
    end
  end
end
