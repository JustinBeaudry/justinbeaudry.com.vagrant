Vagrant.configure(2) do |config|

  config.vm.hostname = "vagrant"

  config.vm.box = "chef/centos-7.0"

  config.vm.network :private_network, ip: "192.168.33.10"

  config.ssh.forward_agent = true

  config.vm.synced_folder "bolt", "/etc/bolt"

  config.vm.provider "virtualbox" do |v|
    v.vmx["memsize"] = "2048"
    v.vmx["numcpus"] = "2"
  end

  config.vm.provision "shell", path: "bolt/init.sh"
end
