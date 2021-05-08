describe SpaceXAPI::Client do
  context '#post' do
    let(:path) { '/path' }
    let(:resource) { 'resource' }
    let(:response_body) { { a: 'hello', b: 'world' } }
    let(:post_response_double) do
      instance_double HTTParty::Response, body: response_body.to_json
    end

    subject do
      described_class.post path: path, body: response_body
    end

    before do
      allow(HTTParty).to receive(:post)
        .and_return(post_response_double)
      allow(SpaceXAPI::Client).to receive(:resource)
        .and_return(resource)
    end

    it 'calls HTTParty#post with expected url and body' do
      expect(HTTParty).to receive(:post).with(
        SpaceXAPI::Client::BASE_URL + resource + path,
        body: response_body
      )
      subject
    end

    it 'returns expected response' do
      expect(subject).to eq(response_body)
    end
  end
end
