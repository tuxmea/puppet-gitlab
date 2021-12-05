# require 'pry'
require 'yaml'
Puppet::Type.type(:gitlab_token).provide(:rails) do
  desc 'Gitlab token generation using gitlab-runner rails command. Only used to create the root_api token'

  confine !File.exist? '/etc/gitlab/root_api_token'
  has_command(:gitlab_rails, '/usr/bin/gitlab-rails')

  def exists?
    File.exists? '/etc/gitlab/root_api_token'
  end

  def create
    gitlab_rails('runner', "token = User.find_by_username('#{resource[:user]}').personal_access_tokens.create(scopes: [#{resource[:scope]}], name: '#{resource[:token_name]}'); token.set_token('#{resource[:token_value]}'); token.save!")
  end

end
