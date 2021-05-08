describe DistanceToOrigin do
  context '#sort' do
    let(:origin) { { lat: 50, lng: -90 } }
    let(:point_a) { { lat: 30, lng: -90 } }
    let(:point_b) { { lat: 51, lng: -89 } }
    let(:point_c) { { lat: 70, lng: - 110 } }
    let(:points) { [point_a, point_b, point_c] }

    subject do
      described_class.new(origin: origin, points: points).sort
    end

    it 'sorts points in order of distance to origin' do
      expect(subject).to eq [point_b, point_a, point_c]
    end
  end
end
