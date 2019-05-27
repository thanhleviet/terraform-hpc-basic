[all:vars]
ansible_ssh_common_args='-o ConnectTimeout=30 -o StrictHostKeyChecking=no -o ProxyCommand="ssh -W %h:%p -q ${username}@${jumpbox_floatingIP}"'

[headnodefrontend]
${headnodename} ansible_ssh_user=ubuntu ansible_connection=ssh ansible_host=${headnodeip} ansible_user=${username}

[controllermiddleware]
${controllername} ansible_ssh_user=ubuntu ansible_connection=ssh ansible_host=${controllerip} ansible_user=${username}