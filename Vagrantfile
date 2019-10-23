
Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
      master.vm.box = "ubuntu/bionic64"
      master.vm.network "private_network", ip: "192.168.33.10"
      # master.vm.provision "shell", path: "setup_master.sh"
  end

  config.vm.define "client1" do |client1|
      client1.vm.box = "centos/7"
      client1.vm.network "private_network", ip: "192.168.33.20"
      # client1.vm.provision "shell", path: "setup_slave.sh", args: "client1"
  end

  config.vm.define "client2" do |client2|
      client2.vm.box = "ubuntu/bionic64"
      client2.vm.network "private_network", ip: "192.168.33.30"
      # client2.vm.provision "shell", path: "setup_slave.sh", args: "client2"
  end
end