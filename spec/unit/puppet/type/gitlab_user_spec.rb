# frozen_string_literal: true

require 'spec_helper'
require 'puppet/type/gitlab_user'

RSpec.describe 'the gitlab_user type' do
  it 'loads' do
    expect(Puppet::Type.type(:gitlab_user)).not_to be_nil
  end
end
