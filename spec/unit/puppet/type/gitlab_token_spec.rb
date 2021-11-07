# frozen_string_literal: true

require 'spec_helper'
require 'puppet/type/gitlab_token'

RSpec.describe 'the gitlab_token type' do
  it 'loads' do
    expect(Puppet::Type.type(:gitlab_token)).not_to be_nil
  end
end
