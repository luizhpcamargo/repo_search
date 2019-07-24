require 'rails_helper'

RSpec.describe RepositoriesController, type: :controller do
  context '#index' do
    before { get :index }

    it { expect(response).to be_success }
  end

  context '#update_data' do
    before do
      VCR.use_cassette('repo/update') do
        post :update_data
      end
    end

    it { expect(response).to redirect_to(root_path) }
  end
end
