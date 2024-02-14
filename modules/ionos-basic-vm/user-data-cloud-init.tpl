#cloud-config
runcmd:
  - sed -i 's/HISTSIZE=1000/HISTSIZE=10000/g' /root/.bashrc
  - sed -i 's/HISTFILESIZE=2000/HISTFILESIZE=20000/g' /root/.bashrc

users:
  - name: technicaluser
    sudo: ALL=(ALL:ALL) NOPASSWD:ALL
    # uid must match the uid of the technical user in infra-schulcloud/ansible/group_vars/all/users.yml variable present_users
    uid: "2215"
    ssh_authorized_keys:
      - ${technicaluser_public_key}
