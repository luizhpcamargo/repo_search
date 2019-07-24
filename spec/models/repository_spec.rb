require 'rails_helper'

RSpec.describe Repository, type: :model do
  it { expect(described_class.per_language).to be_a Hash }
end
