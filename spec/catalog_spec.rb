require 'spec_helper'

describe 'impala::catalog' do
  context 'on Centos 6.5 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.5) do |node|
        node.automatic['domain'] = 'example.com'
        stub_command(/update-alternatives --display /).and_return(false)
      end.converge(described_recipe)
    end

    it 'installs impala-catalog package' do
      expect(chef_run).to install_package('impala-catalog')
    end

    it 'starts impala-catalog service' do
      expect(chef_run).to start_service('impala-catalog')
    end

    it 'enables impala-catalog service' do
      expect(chef_run).to enable_service('impala-catalog')
    end
  end
end
