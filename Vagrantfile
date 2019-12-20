
Vagrant.configure("2") do |config|

  config.vm.define "supermaster" do |supermaster|
    supermaster.vm.box = "centos/7"
    supermaster.vm.network "private_network", ip: "192.168.33.1"
    supermaster.vm.provision "shell", path: "setup_supermaster.sh"
    # master.vm.provision "shell", path: "rsyslog.sh"
    supermaster.timezone.value = "America/New_York"
    supermaster.vm.network "forwarded_port", guest: 80, host: 8081
end

config.vm.define "mastergui" do |mastergui|
  mastergui.vm.box = "centos/7"
  mastergui.vm.network "private_network", ip: "192.168.33.11"
  mastergui.vm.provision "shell", path: "setup_supermaster.sh"
  # master.vm.provision "shell", path: "rsyslog.sh"
  mastergui.timezone.value = "America/New_York"
  mastergui.vm.network "forwarded_port", guest: 80, host: 8082
end

  config.vm.define "client1" do |client1|
      client1.vm.box = "centos/7"
      client1.vm.network "private_network", ip: "192.168.33.20"
      client1.vm.provision "shell", path: "setup_client.sh", args: "client1"
      client1.vm.provision "shell", path: "rsyslog.sh"
      client1.timezone.value = "America/New_York"
  end

  config.vm.define "client2" do |client2|
      client2.vm.box = "ubuntu/bionic64"
      client2.vm.network "private_network", ip: "192.168.33.30"
      client2.vm.provision "shell", path: "setup_client.sh", args: "client2"
      client2.vm.provision "shell", path: "rsyslog.sh"
      client2.timezone.value = "America/New_York"
  end
end