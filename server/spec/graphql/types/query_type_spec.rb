describe Types::QueryType do
  subject { described_class }

  it { is_expected.to have_field(:closest_satellites).of_type '[Satellite!]!' }

  describe 'closestSatellites' do
    subject { Types::QueryType.fields['closestSatellites'] }

    it { is_expected.to accept_argument(:lat).of_type 'Float!' }
    it { is_expected.to accept_argument(:lng).of_type 'Float!' }
    it { is_expected.to accept_argument(:number_of_satellites).of_type 'Int!' }
  end
end
