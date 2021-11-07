require 'spec_helper'
provider_class = Puppet::Type.type(:gitlab_user).provider(:ruby)

describe provider_class do
  let(:resource) do
    Puppet::Type::Gitlab_user.new do
      {
        shortname: 'test',
        email: 'test@domain.tld',
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
