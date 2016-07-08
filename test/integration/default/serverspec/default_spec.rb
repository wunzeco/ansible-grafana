require 'spec_helper'

describe package('grafana') do
  it { should be_installed }
end

describe file('/etc/grafana/grafana.ini') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 640 }
end

describe file('/etc/grafana/ldap.toml') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 640 }
end

if os[:family] == 'ubuntu'
  describe file('/etc/default/grafana-server') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_mode 644 }
  end
end

if os[:family] == 'redhat'
  describe file('/etc/sysconfig/grafana-server') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_mode 644 }
  end
end

%w( 
  grafana-piechart-panel
  grafana-worldmap-panel
).each do |plugin|
  describe file("/var/lib/grafana/plugins/#{plugin}") do
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_mode 755 }
  end
end

describe file('/var/lib/grafana/plugins/grafana-example-app') do
  it { should_not exist }
end

describe service('grafana-server') do
  it { should be_running }
end
