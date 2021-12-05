Puppet::Type.newtype(:gitlab_project) do
  @doc = "Manage gitlab projects.

  Needs the gitlab_token for the root user to be set.

  gitlab_project { 'project1':
    ensure       => present,
    projekctname => 'project1',
    groupname    => 'group1',
    origin_url   => 'https://github.com/voxpupuli/puppet-gitlab.git',
  }
  "
  ensurable

  newparam(:projectname, namevar: true) do
    desc 'The project to manage'
    validate do |value|
      unless value =~ %r(\w+)
        raise ArgumentError, "key must be a string, not #{value.class}"
      end
    end
  end

  newproperty(:groupname) do
    desc 'The group to add the project to'
    validate do |value|
      unless value =~ %r(\w+)
        raise ArgumentError, "key must be a string, not #{value.class}"
      end
    end
  end

  newparam(:origin_url) do
    desc 'Hash of users and their roles'
    validate do |value|
      unless value.class == Hash
        raise ArgumentError, "key must be a hash value, not #{value.class}"
      end
    end
  end

end
