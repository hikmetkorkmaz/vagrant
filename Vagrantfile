# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

VAGRANT_BOX = "ubuntu/focal64"
VAGRANT_BOX_VERSION = "20221010.0.0"
CPUS_APP_NODE = 2
CPUS_JENKINS_NODE = 2
CPUS_REDIS_NODE = 2
CPUS_MYSQL_NODE = 2
MEMORY_APP_NODE  = 2048
MEMORY_JENKINS_NODE  = 1024
MEMORY_REDIS_NODE  = 2048
MEMORY_MYSQL_NODE  = 2048
APP_NODE_COUNT  = 1


Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "scripts/bootstrap.sh"

  # Dotnet Core Server
  config.vm.define "app" do |node|
  
    node.vm.box               = VAGRANT_BOX
    node.vm.box_check_update  = false
    node.vm.box_version       = VAGRANT_BOX_VERSION
    node.vm.hostname          = "www.bistock.test"

    node.vm.network "private_network", ip: "172.16.16.100"
  
    node.vm.provider :virtualbox do |v|
      v.name    = "app"
      v.memory  = MEMORY_APP_NODE
      v.cpus    = CPUS_APP_NODE
    end
  
    node.vm.provider :libvirt do |v|
      v.memory  = MEMORY_APP_NODE
      v.nested  = true
      v.cpus    = CPUS_APP_NODE
    end
  
    node.vm.provision "shell", path: "scripts/dotnet.sh"
  
  end


  # Jenkins Nodes

    config.vm.define "jenkins" do |node|

      node.vm.box               = VAGRANT_BOX
      node.vm.box_check_update  = false
      node.vm.box_version       = VAGRANT_BOX_VERSION
      node.vm.hostname          = "jenkins.bistock.test"

      node.vm.network "private_network", ip: "172.16.16.101"
	  node.vm.network "forwarded_port", guest: 8080, host: 80

      node.vm.provider :virtualbox do |v|
        v.name    = "jenkins"
        v.memory  = MEMORY_JENKINS_NODE
        v.cpus    = CPUS_JENKINS_NODE
      end

      node.vm.provider :libvirt do |v|
        v.memory  = MEMORY_JENKINS_NODE
        v.nested  = true
        v.cpus    = CPUS_JENKINS_NODE
      end

      node.vm.provision "shell", path: "scripts/jenkins.sh"

    end

  end