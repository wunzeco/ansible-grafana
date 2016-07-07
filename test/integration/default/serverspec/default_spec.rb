require 'spec_helper'

describe package('grafana') do
  it { should be_installed }
end

describe file('/etc/grafana/grafana.ini') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 640 }
end

describe file('/etc/default/grafana-server') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 644 }
end

describe service('grafana') do
  it { should be_running }
end
