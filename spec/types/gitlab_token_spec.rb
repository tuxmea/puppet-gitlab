require 'spec_helper'
describe 'gitlab_token' do
  let(:title) { 'tokenname' }

  #it { is_expected.to be_valid_type.with_properties('value') }
  it { is_expected.to be_valid_type.with_parameters('token') }
end
