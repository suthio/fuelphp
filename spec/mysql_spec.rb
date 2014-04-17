require 'serverspec'
require 'pathname'
require 'net/ssh'
 
include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS
 
describe package('mysql-server') do
  it { should be_installed }
end
 
describe service('mysqld') do
    it { should be_enabled }
    it { should be_running }
end
 
describe port(3306) do
    it { should be_listening }
end
 
