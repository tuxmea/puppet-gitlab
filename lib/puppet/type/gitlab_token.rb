Puppet::Type.newtype(:gitlab_token) do
  @doc = 'Manage gitlab user tokens.'

  ensurable

  newparam(:token, namevar: true) do
    desc 'The name of the token to manage'
    validate do |value|
      unless value =~ %r(\w+)
        raise ArgumentError, "key must be a string, not #{value.class}"
      end
    end
  end

  newparam(:value) do
    desc "The tokane itself, must be 20 cahrs long, defaults to voxpupuli-gitlab-123"
    default 'voxpupuli-gitlab-123'
    validate do |value|
      unless value.length == 20
        raise ArgumentError, "The token must be 20 chars long. Not #{value.length}"
      end
    end
  end

  newparam(:user) do
    desc "The user for which to manage a token for"
  end
end
