require 'spec_helper'

describe 'impala::config' do
  context 'on Centos 6.5 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.5) do |node|
        node.automatic['domain'] = 'example.com'
        node.default['hive']['hive_site']['hive.metastore.uris'] = 'thrift://foo:9093'
        node.default['impala']['conf_dir'] = 'conf.chef'
        stub_command(/update-alternatives --display /).and_return(false)
      end.converge(described_recipe)
    end

    %w(/etc/impala/conf.chef /etc/default /var/log/impala).each do |dir|
      it "creates #{dir} directory" do
        expect(chef_run).to create_directory(dir)
      end
    end

    %w(/etc/default/impala /etc/impala/conf.chef/hive-site.xml).each do |template|
      it "renders #{template} from template" do
        expect(chef_run).to create_template('/etc/default/impala').with(
          user: 'impala',
          group: 'impala'
        )
      end
    end

    it 'runs execute[update impala-conf alternatives]' do
      expect(chef_run).to run_execute('update impala-conf alternatives')
    end
  end
end
