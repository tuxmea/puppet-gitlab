Puppet::Type.newtype(:gitlab_user) do
  @doc = 'Manage gitlab users.'

  ensurable

  newparam(:shortname, namevar: true) do
    desc 'The user to manage'
    validate do |value|
      unless value =~ %r(\w+)
        raise ArgumentError, "user must be a string, not #{value.class}"
      end
    end
  end

  newparam(:email) do
  end

  newparam(:longname) do
  end

  newproperty(:password) do
  end

  newproperty(:confirmed) do
  end

end
