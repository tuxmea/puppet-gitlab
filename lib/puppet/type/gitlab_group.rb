Puppet::Type.newtype(:gitlab_group) do
  @doc = "Manage gitlab groups.

  Needs the gitlab_token for the root user to be set.

  gitlab_group { 'group1':
    ensure      => present,
    groupname   => 'group1',
    member_role => {
      'user1' => 'maintainer',
      'user2' => 'developer',
    },
  }
  "
  ensurable

  newparam(:groupuser, namevar: true) do
    desc 'The group to manage'
    validate do |value|
      unless value =~ %r(\w+)
        raise ArgumentError, "key must be a string, not #{value.class}"
      end
    end
  end

  newparam(:member_role) do
    desc 'Hash of users and their roles'
    validate do |value|
      unless value.class == Hash
        raise ArgumentError, "key must be a hash value, not #{value.class}"
      end
    end
  end

end
