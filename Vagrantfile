# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network 'private_network', ip: '10.1.1.10'
  config.vm.network :forwarded_port, guest: 3306, host: 3306

  config.vm.provision "shell" do |s|
    s.path = "scripts/common.sh"
  end

  config.vm.provision "shell" do |s|
    s.name = "instal MySQL"
    s.path = "scripts/mysql.sh"
  end

  config.vm.provision "shell", inline: <<-SHELL
    yum clean all
  SHELL
end
