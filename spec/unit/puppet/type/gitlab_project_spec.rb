# frozen_string_literal: true

require 'spec_helper'
require 'puppet/type/gitlab_project'

RSpec.describe 'the gitlab_project type' do
  it 'loads' do
    expect(Puppet::Type.type(:gitlab_project)).not_to be_nil
  end
end
