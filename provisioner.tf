/* Local Provisioners */

resource "null_resource" "common-deploy" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "sleep 60 & echo \"Sleeping to wait for servers to settle....!\" "
  }

  provisioner "local-exec" {
    command = "ansible-playbook ansible/site.yml --become"
  }
  depends_on = [openstack_compute_floatingip_associate_v2.headnode_floating_ip]
}