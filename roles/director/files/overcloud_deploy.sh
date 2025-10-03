#!/usr/bin/bash

args=
if [ -f /home/stack/overcloud-deploy/dcn0/dcn_ceph.yaml ]; then
    args='-e /home/stack/overcloud-deploy/dcn0/dcn_ceph.yaml'
fi

openstack overcloud deploy --templates \\
  --stack central \\
  -r /home/stack/central/roles_data.yaml \\
  -n /home/stack/central/network_data.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovn-dvr-ha.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/nova-az-config.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/cephadm/cephadm.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/cephadm/ceph-mds.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/cephadm/ceph-dashboard.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/manila-cephfsganesha-config.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/cinder-backup-active-active.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/enable-designate.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/services/octavia.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/ssl/tls-everywhere-endpoints-dns.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/services/haproxy-public-tls-certmonger.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/ssl/enable-internal-tls.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/compute-instanceha.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/services/ironic-overcloud.yaml \\
  -e /usr/share/openstack-tripleo-heat-templates/environments/services/ironic-inspector.yaml \\
  -e /home/stack/central/overcloud-baremetal-deployed.yaml \\
  -e /home/stack/central/deployed_ceph.yaml \\
  -e /home/stack/central/overcloud-networks-deployed.yaml \\
  -e /home/stack/central/overcloud-vip-deployed.yaml \\
  -e /home/stack/containers-prepare-parameter.yaml \\
  -e /home/stack/central/inject-trust-anchor-hiera.yaml \\
  -e /home/stack/central/node-info.yaml \\
  -e /home/stack/central/glance.yaml \\
  -e /home/stack/central/site-name.yaml \\
  -e /home/stack/central/tls-parameters.yaml \\
  -e /home/stack/central/fencing.yaml \\
  -e /home/stack/central/ironic-overrides.yaml \\
  --ntp-server 10.0.0.200 \\
  \$args   