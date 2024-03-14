Puppet::Type.newtype(:gitlab_token) do
  @doc = 'Manage gitlab tokens'

  ensurable

  newparam(:user, namevar: true) do
    desc 'The user to create the token for'
  end

  newproperty(:token) do
    desc 'The value of the token'
  end

  newproperty(:scope) do
    desc 'The scope for which the token is valid'
  end

end
