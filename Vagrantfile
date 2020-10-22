Vagrant.configure("2") do |config|

  # ---------------------------------
  # ansible2.hl.local
  # ---------------------------------
  config.vm.define "ansible2.hl.local" do |ansible2|
    ansible2.vm.box = "centos/7"
    ansible2.vm.hostname = "ansible2.hl.local"
    ansible2.vm.network "private_network", ip: "172.16.10.12"
    ansible2.vm.provision "file", source: "./ansible_exam.pub", destination: "/home/vagrant/.ssh/ansible_exam.pub"
    ansible2.vm.provision "shell", inline: <<-SHELL
      cat /home/vagrant/.ssh/ansible_exam.pub >> /home/vagrant/.ssh/authorized_keys
    SHELL
    ansible2.vm.provision "shell", inline: <<-SHELL
      sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
      systemctl restart sshd.service
    SHELL
    ansible2.vm.provider :virtualbox do |vb|
      vb.name = "ansible2.hl.local"
    end
  end

  # ---------------------------------
  # ansible3.hl.local
  # ---------------------------------
  config.vm.define "ansible3.hl.local" do |ansible3|
    ansible3.vm.box = "centos/7"
    ansible3.vm.hostname = "ansible3.hl.local"
    ansible3.vm.network "private_network", ip: "172.16.10.13"
    ansible3.vm.provision "file", source: "./ansible_exam.pub", destination: "/home/vagrant/.ssh/ansible_exam.pub"
    ansible3.vm.provision "shell", inline: <<-SHELL
      cat /home/vagrant/.ssh/ansible_exam.pub >> /home/vagrant/.ssh/authorized_keys
    SHELL
    ansible3.vm.provision "shell", inline: <<-SHELL
      sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
      systemctl restart sshd.service
    SHELL
    ansible3.vm.provider :virtualbox do |vb|
      vb.name = "ansible3.hl.local"
    end
  end

  # ---------------------------------
  # ansible4.hl.local
  # ---------------------------------  
  config.vm.define "ansible4.hl.local" do |ansible4|
    ansible4.vm.box = "centos/7"
    ansible4.vm.hostname = "ansible4.hl.local"
    ansible4.vm.network "private_network", ip: "172.16.10.14"
    ansible4.vm.provision "file", source: "./ansible_exam.pub", destination: "/home/vagrant/.ssh/ansible_exam.pub"
    ansible4.vm.provision "shell", inline: <<-SHELL
      cat /home/vagrant/.ssh/ansible_exam.pub >> /home/vagrant/.ssh/authorized_keys
    SHELL
    ansible4.vm.provision "shell", inline: <<-SHELL
      sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
      systemctl restart sshd.service
    SHELL
    ansible4.vm.provider :virtualbox do |vb|
      vb.name = "ansible4.hl.local"
    end
  end

  # ---------------------------------
  # ansible5.hl.local
  # ---------------------------------
  config.vm.define "ansible5.hl.local" do |ansible5|
    ansible5.vm.box = "centos/7"
    ansible5.vm.hostname = "ansible5.hl.local"
    ansible5.vm.network "private_network", ip: "172.16.10.15"
    ansible5.vm.disk :disk, name: "backup", size: "1GB"

    ansible5.vm.provision "file", source: "./ansible_exam.pub", destination: "/home/vagrant/.ssh/ansible_exam.pub"
    ansible5.vm.provision "shell", inline: <<-SHELL
      cat /home/vagrant/.ssh/ansible_exam.pub >> /home/vagrant/.ssh/authorized_keys
    SHELL
    ansible5.vm.provision "shell", inline: <<-SHELL
      sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
      systemctl restart sshd.service
    SHELL
    ansible5.vm.provider :virtualbox do |vb|
      vb.name = "ansible5.hl.local"
      unless File.exist?('./sdb5.1.vdi')
        vb.customize ['createhd', '--filename', './sdb5.1.vdi', '--variant', 'Fixed', '--size', 1 * 1024]
      end
      vb.customize ['storageattach', :id,  '--storagectl', 'IDE', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', './sdb5.1.vdi']
      unless File.exist?('./sdb5.2.vdi')
        vb.customize ['createhd', '--filename', './sdb5.2.vdi', '--variant', 'Fixed', '--size', 5 * 1024]
      end
      vb.customize ['storageattach', :id,  '--storagectl', 'IDE', '--port', 1, '--device', 1, '--type', 'hdd', '--medium', './sdb5.2.vdi']
    end
  end

  # ---------------------------------
  # ansible-control.hl.local
  # ---------------------------------
  config.vm.define "ansible-control.hl.local" do |ansible_control|
    ansible_control.vm.box = "centos/7"
    ansible_control.vm.hostname = "ansible-control.hl.local"
    ansible_control.vm.network "private_network", ip: "172.16.10.11"
    ansible_control.vm.provision "file", source: "./ansible_exam", destination: "/home/vagrant/.ssh/ansible_exam"
    ansible_control.vm.provision "shell", inline: <<-SHELL
      sudo yum -y install epel-release
      sudo yum -y install ansible
    SHELL
    ansible_control.vm.provision "shell", inline: <<-SHELL
      echo "Host *" > /home/vagrant/.ssh/config
      echo "StrictHostKeyChecking no" >> /home/vagrant/.ssh/config
      for i in {12..15}; do ANSIBLE_HOST_KEY_CHECKING=false ansible -c ssh --private-key /home/vagrant/.ssh/ansible_exam -i "172.16.10.${i}," -u vagrant -m ping all; done;
    SHELL
    ansible_control.vm.provider :virtualbox do |vb|
      vb.name = "ansible-control.hl.local"
    end
  end

end
