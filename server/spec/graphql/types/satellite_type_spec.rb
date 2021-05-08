describe Types::SatelliteType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type 'ID!' }
  it { is_expected.to have_field(:name).of_type 'String!' }
  it { is_expected.to have_field(:lat).of_type 'Float!' }
  it { is_expected.to have_field(:lng).of_type 'Float!' }
end
