# -*- mode: ruby -*-
# vi: set ft=ruby :

vagrant_root = File.dirname(__FILE__)
sd_card_dir = "/dev"

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = "1"
    vb.gui = false
  end

  config.vm.define "nerves" do |nerves| 
    nerves.vm.synced_folder "#{vagrant_root}/shared", "/home/vagrant/shared"
    nerves.vm.synced_folder "#{sd_card_dir}", "/home/vagrant#{sd_card_dir}"
  end

  #nerves.vm.provision :shell, :path => "#{vagrant_root}/provision/djangonode-setup.sh"
end
