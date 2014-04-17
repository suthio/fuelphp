# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "vagrant-fuel-berkshelf"

  config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"

  config.vm.box_url = "https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box"

  config.vm.network :private_network, ip: "33.33.33.10"

  # config.vm.synced_folder "../data", "/vagrant_data"

  vb.customize ["modifyvm", :id, "--memory", "1024"]

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  #config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      }
    }

    chef.run_list = [
        "recipe[vagrant-fuel::default]"
    ]
  end

  config.omnibus.chef_version = :latest
end
