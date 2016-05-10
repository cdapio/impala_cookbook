require 'spec_helper'

describe 'impala::server' do
  context 'on Centos 6.5 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.5) do |node|
        node.automatic['domain'] = 'example.com'
        stub_command(/update-alternatives --display /).and_return(false)
        stub_command(/test -L /).and_return(false)
      end.converge(described_recipe)
    end

    it 'installs impala-server package' do
      expect(chef_run).to install_package('impala-server')
    end

    it 'starts impala-server service' do
      expect(chef_run).to start_service('impala-server')
    end

    it 'enables impala-server service' do
      expect(chef_run).to enable_service('impala-server')
    end
  end
end
