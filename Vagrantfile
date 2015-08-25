Vagrant.configure(2) do |config|

  config.vm.box = "chef/centos-7.0"

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.synced_folder "bolt", "/etc/bolt" 
end
