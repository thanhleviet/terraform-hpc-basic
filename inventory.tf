//Obtain data from terraform data provider and push to a template file 
//which closely represents an ansible inventory file. 

data  "template_file" "slurm" {
    template = "${file("./templates/slurm.tpl")}"
    vars {
        headnodename = "${openstack_compute_instance_v2.slurm_headnode.name}"
        headnodeip = "${openstack_compute_instance_v2.slurm_headnode.access_ip_v4}"
    }
}
data  "template_file" "gatewayd" {
    template = "${file("./templates/gatewayd.tpl")}"
    vars {
        username = "${var.ssh_user_name}"
        gatewayd_floatingIP = "${openstack_networking_floatingip_v2.floating_ip.address}"
    }
}
resource "local_file" "slurm_file" {
  content  = "${data.template_file.slurm.rendered}"
  filename = "./inventory/slurm-inventory"
}
resource "local_file" "gatewayd_file" {
  content  = "${data.template_file.gatewayd.rendered}"
  filename = "./ansible/group_vars/gatewayd.yml"
}
