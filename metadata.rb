name             'impala'
maintainer       'Cask Data, Inc.'
maintainer_email 'ops@cask.co'
license          'Apache 2.0'
description      'Installs/Configures Impala'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

%w(hadoop java).each do |cb|
  depends cb
end

%w(amazon centos debian redhat scientific ubuntu).each do |os|
  supports os
end

source_url 'https://github.com/caskdata/impala_cookbook' if respond_to?(:source_url)
issues_url 'https://issues.cask.co/browse/COOK/component/10613' if respond_to?(:issues_url)
