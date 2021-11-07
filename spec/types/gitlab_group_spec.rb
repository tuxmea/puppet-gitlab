require 'spec_helper'
describe 'gitlab_group' do
  let(:title) { 'groupname' }

  it { is_expected.to be_valid_type.with_parameters('group') }
end
