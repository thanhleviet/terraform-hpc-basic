ansible_ssh_common_args: '-o StrictHostKeyChecking=no -o ProxyCommand="ssh -W %h:%p -q ${username}@${jumpbox_floatingIP}"'