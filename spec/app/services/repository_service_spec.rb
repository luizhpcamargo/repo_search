require 'rails_helper'

describe RepositoryService do
  context '#search' do
    let(:subject) { described_class.new(language: :ruby) }
    let(:search_endpoint) { '/search/repositories'.freeze }
    let(:response) { search.response }
    let(:body) { JSON.parse(response.body) }
    let(:items) { body['items'] }
    let(:search) do
      VCR.use_cassette('search') do
        subject.search
      end
    end

    it { expect(described_class).to include HTTParty }
    it { expect(described_class.base_uri).to eq 'https://api.github.com' }
    it { expect(RepositoryService::SEARCH_ENDPOINT).to eq search_endpoint }
    it { expect(items.size).to be 5 }
    it { expect(items[0]['full_name']).to eq 'rails/rails' }
    it { expect(items[1]['full_name']).to eq 'jekyll/jekyll' }
    it { expect(items[2]['full_name']).to eq 'discourse/discourse' }
  end
end
