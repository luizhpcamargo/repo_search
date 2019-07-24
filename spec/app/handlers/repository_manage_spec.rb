require 'rails_helper'

describe RepositoryManage do
  context '#update' do
    let(:languages) { %i[ruby elixir python javascript go] }

    let(:update) do
      VCR.use_cassette('repo/update') do
        described_class.new.update
      end
    end

    it { expect(RepositoryManage::LANGUAGES).to eq languages }
    it { expect { update }.to change{ Repository.count }.by(25) }

    context 'when calling languages' do
      let(:body) { double(body: '{"items": []}') }
      let(:search) { double(response: body) }
      let(:service) { double(search: search) }

      after { update }

      it do
        expect(RepositoryService).to receive(:new).with(language: :ruby).and_return(service).once
        expect(RepositoryService).to receive(:new).with(language: :elixir).and_return(service).once
        expect(RepositoryService).to receive(:new).with(language: :python).and_return(service).once
        expect(RepositoryService).to receive(:new).with(language: :javascript).and_return(service).once
        expect(RepositoryService).to receive(:new).with(language: :go).and_return(service).once
      end
    end
  end
end
