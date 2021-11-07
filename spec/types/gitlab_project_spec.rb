require 'spec_helper'
describe 'gitlab_project' do
  let(:title) { 'projectname' }

  it { is_expected.to be_valid_type.with_parameters('project') }
end
