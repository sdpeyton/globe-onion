describe SpaceXAPI::Starlink do
  context '#get_satellites' do
    let(:mock_satellite_response) do
      {
        docs: [{
          id: 'uuid',
          latitude: 25,
          longitude: -71,
          spaceTrack: {
            OBJECT_NAME: 'Triangle'
          }
        }]
      }
    end
    let(:expected_return) do
      [{
        id: 'uuid',
        name: 'Triangle',
        lat: 25,
        lng: -71
      }]
    end

    subject { described_class.get_satellites }

    before do
      allow(SpaceXAPI::Client).to receive(:post)
        .and_return(mock_satellite_response)
    end

    it 'calls SpaceXAPI::Client#post with expected args' do
      expect(SpaceXAPI::Client).to receive(:post).with(
        path: '/query',
        body: SpaceXAPI::Starlink::SATELLITE_QUERY_PARAMS
      )
      subject
    end

    it 'returns satellites in expected format' do
      expect(subject).to eq(expected_return)
    end
  end
end
