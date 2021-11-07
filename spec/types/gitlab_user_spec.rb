require 'spec_helper'
describe 'gitlab_user' do
  let(:title) { 'username' }

  it { is_expected.to be_valid_type.with_parameters('username') }
end
