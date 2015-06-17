# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
# Automatically upgrade virtual box guest additions if vbguest plugin is installed or not
VBGUEST_AUTO = ENV["V_VBGUEST_AUTO"] || "1"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "mcol01" do |mcol01|
    mcol01.vm.network "private_network", ip: "192.168.5.2"
    # mcol01.vm.provision "shell", path: "shell/install_puppet_repo.sh"
    mcol01.vm.provision "shell", path: "shell/bootstrap.sh"
    mcol01.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "init.pp"
      puppet.module_path = 'modules/'
      # puppet.module_path = '/etc/puppet/modules/'
      puppet.options = "--verbose --debug"
    end
    mcol01.vm.provider "vmware_fusion" do |vmware|
      vmware.vmx["memsize"] = "2048"
      vmware.customize ["modifyvm", :id, "--cpus", "1"]
    end
    mcol01.vm.provider "virtualbox" do |virtualbox|
      virtualbox.memory = 512
      virtualbox.cpus = 1
    end
    mcol01.vm.box = "ubuntu/trusty64"
    mcol01.vm.host_name = "mcol01.vm"
  end

  if Vagrant.has_plugin?("vagrant-vbguest")
    unless VBGUEST_AUTO == "1"
      puts "Skipping vbguest auto update"
      config.vbguest.auto_update = false
    end
  else
    puts "Installing vagrant-vbguest plugin is highly recommended!"
  end
end
