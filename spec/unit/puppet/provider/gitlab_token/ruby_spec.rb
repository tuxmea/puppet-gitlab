require 'spec_helper'
provider_class = Puppet::Type.type(:gitlab_token).provider(:ruby)

describe provider_class do
  let(:resource) do
    Puppet::Type::Gitlab_token.new do
      {
        token: 'test',
        user: 'root',
      }
    end
  end

  let(:provider) do
    provider_class.new(@resource) # rubocop:disable RSpec/InstanceVariable
  end

  it 'exists' do
    provider_class.new(@resource) # rubocop:disable RSpec/InstanceVariable
  end
end
