Puppet::Type.newtype(:gitlab_user) do
  @doc = "Manage gitlab users.

  Needs the gitlab_token for the root user to be set.

  gitlabuser { 'user1':
    ensure      => present,
    username    => 'user1',
    realname    => 'First Last',
    password    => '12345678',
    autoconfirm => true,
    email       => 'user1@domain.tld',
  }
  "
  ensurable

  newproperty(:realname) do
    desc 'The real name of the user (First Last)'
    validate do |value|
      unless value =~ %r(\w+)
        raise ArgumentError, "key must be a string, not #{value.class}"
      end
    end
  end

  newparam(:username, namevar: true) do
    desc 'The user to manage'
    validate do |value|
      unless value =~ %r(\w+)
        raise ArgumentError, "key must be a string, not #{value.class}"
      end
    end
  end

  newparam(:autoconfirm) do
    desc 'Set to true to immediately activate the user'
    validate do |value|
      unless value.class == Boolean
        raise ArgumentError, "key must be a boolean value, not #{value.class}"
      end
    end
  end

  newproperty(:password) do
    desc 'The users password'
  end

  newproperty(:email) do
    desc 'The users email address'
  end
end
