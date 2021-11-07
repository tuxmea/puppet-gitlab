# frozen_string_literal: true

require 'spec_helper'
require 'puppet/type/gitlab_group'

RSpec.describe 'the gitlab_group type' do
  it 'loads' do
    expect(Puppet::Type.type(:gitlab_group)).not_to be_nil
  end
end
