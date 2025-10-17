# rhosp17.1oneclick


Preparation:
1. Reserve a physical host from beaker;
2. install packages on physical hosts: 
# dnf install git ansible-core rhel-system-roles tree -y
3. Git clone the repo:
# git clone https://github.com/lufengnz/rhosp17.1oneclick.git
# cd rhosp17.1oneclick/
# ansible-galaxy collection install -r collections/requirements.yml
4. Go to https://access.redhat.com/downloads/content and obtain the link for (url validates for 240 minutes):
    Red Hat Enterprise Linux 9.2 KVM Guest Image 
    Red Hat Enterprise Linux 8.4 KVM Guest Image
    update url respectively in group_vars/physical_hardware/vm_provison.yml;
5. Update your rhn user and password in group_vars/physical_hardware/vm_provison.yml;
6. Update your domain name in group_vars/all/main.yml;
7. Create a registry service account following the steps in: https://access.redhat.com/articles/RegistryAuthentication#creating-registry-service-accounts-6
   update group_vars/undercloud/director.yml;
