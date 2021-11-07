Puppet::Type.newtype(:gitlab_project) do
  @doc = 'Create gitlab projects.'

  ensurable

  newparam(:project, namevar: true) do
    desc 'The key to manage'
    validate do |value|
      unless value =~ %r(\w+)
        raise ArgumentError, "key must be a string, not #{value.class}"
      end
    end
  end

  newparam(:private) do
  end

  newparam(:path) do
  end

  newparam(:members) do
  end

end
