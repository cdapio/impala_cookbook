require 'spec_helper'

describe 'impala::state_store' do
  context 'on Centos 6.5 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.5) do |node|
        node.automatic['domain'] = 'example.com'
        stub_command(/update-alternatives --display /).and_return(false)
      end.converge(described_recipe)
    end

    it 'installs impala-state-store package' do
      expect(chef_run).to install_package('impala-state-store')
    end
  end
end
