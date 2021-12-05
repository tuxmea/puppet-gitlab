Puppet::Type.newtype(:gitlab_token) do
  @doc = "Manage gitlab user tokens.

  Needs the gitlab api token for the root user to be set.

  gitlab_token { 'root_api':
    ensure      => present,
    name        => 'root_api',
    token_name  => 'api',
    user        => 'root',
    scope       => 'api',
    token_value => '12345678901234567890',
    expiry_date => '2022-12-31'
  }

  The gitlab root_api token is handled differently:

  If ensure is se to present, the token will be stored on disk in /etc/gitlab/root_api_token.
  If ensure is set to absent, the token will be removed from gitlab and the file will be deleted.
  The root_api token is a dependency for any other gitlab resource type.

  If the root_api token is missing, all other gitlab resource types (gitlab_user, gitlab_group, gitlab_project) will be non-functional.

  Additional user tokens can be added in the same way:

  gitlab_token { 'user1_read_repository':
    ensure     => present,
    token_name => 'read_repository',
    user       => 'user1',
    scope      => 'read_repository',
  }
  "
  ensurable

  newparam(:name, namevar: true) do
    desc 'The namevar of the token. Should be set to <user>_<name> user to allow users to have same token names in their account'
    validate do |value|
      unless value =~ %r(\w+)
        raise ArgumentError, "key must be a string, not #{value.class}"
      end
    end
  end

  newproperty(:token_name) do
    desc 'The name of the token'
    defaultto value(:name)
    validate do |value|
      unless value =~ %r(\w+)
        raise ArgumentError, "key must be a string, not #{value.class}"
      end
    end
  end

  newparam(:user) do
    desc 'Set to the user for which the token should be managed'
    validate do |value|
      unless value.class == String
        raise ArgumentError, "key must be a string value, not #{value.class}"
      end
    end
  end

  newproperty(:scopes) do
    desc 'The token scopes to set. Allowed array values: api, read_user, read_api, read_repository, write_repository'
    newvalues(:api, :read_user, :read_api, :read_repository, :write_repository)
  end

  newproperty(:token_value) do
    desc 'The value of the token to be set. Required property for root_api token, May not be set on any other gitlab_token declaration'
    validate do |t_value|
      unless value(:name) == 'root_api' do
        raise ArgumentError, 'token_value may only be set when used with root_api token'
      else
        unless t_value.class == String
          raise ArgumentError, "token_value must be a string value, not #{t_value.class}"
      end
    end
  end

  newproperty(:expiry_date) do
    desc 'The date when a token should expire. Format: YYYY-MM-DD'
    validate do |value|
      unless value.class == String
        raise ArgumentError, "expiry_date must be a string value, not #{value.class}"
      end
    end
  end

  unless value(:name) == 'root_api'
    autorequire(:gitlab_token) do
      'root_api'
    end
  end
end
