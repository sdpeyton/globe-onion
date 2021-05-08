describe Resolvers::ClosestSatellites do
  let(:starlink_response) { {} }
  let(:distance_to_origin_double) { instance_double(DistanceToOrigin) }
  let(:distance_to_origin_response) { [*1..3] }
  let(:lat) { 1 }
  let(:lng) { 9 }

  subject { described_class.run(lat: lat, lng: lng, number_of_satellites: 2) }

  before do
    allow(SpaceXAPI::Starlink).to receive(:get_satellites)
      .and_return(starlink_response)
    allow(DistanceToOrigin).to receive(:new)
      .and_return(distance_to_origin_double)
    allow(distance_to_origin_double).to receive(:sort)
      .and_return(distance_to_origin_response)
  end

  it 'calls SpaceXAPI::Starlink to get satellites' do
    expect(SpaceXAPI::Starlink).to receive(:get_satellites)
    subject
  end

  it 'calls DistanceToOrigin to sort satellites' do
    expect(DistanceToOrigin).to receive(:new).with(
      origin: { lat: lat, lng: lng },
      points: starlink_response
    )
    subject
  end

  it 'returns expected number of satellites' do
    expect(subject).to eq([1, 2])
  end
end
