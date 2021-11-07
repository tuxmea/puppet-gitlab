require 'spec_helper'
provider_class = Puppet::Type.type(:gitlab_project).provider(:ruby)

describe provider_class do
  let(:resource) do
    Puppet::Type::Gitlab_project.new do
      {
        key: 'test',
        value: '1G',
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
