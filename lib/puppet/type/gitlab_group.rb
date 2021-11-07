Puppet::Type.newtype(:gitlab_group) do
  @doc = 'Manage gitlab groups.'

  ensurable

  newparam(:group, namevar: true) do
    desc 'The key to manage'
    validate do |value|
      unless value =~ %r(\w+)
        raise ArgumentError, "key must be a string, not #{value.class}"
      end
    end
  end

  newparam(:path) do
  end

  newparam(:private) do
  end

  newparam(:members) do
  end

end
