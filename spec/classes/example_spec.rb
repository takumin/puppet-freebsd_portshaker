require 'spec_helper'

describe 'freebsd_portshaker' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "freebsd_portshaker class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('freebsd_portshaker::params') }
        it { should contain_class('freebsd_portshaker::install').that_comes_before('freebsd_portshaker::config') }
        it { should contain_class('freebsd_portshaker::config') }
        it { should contain_class('freebsd_portshaker::service').that_subscribes_to('freebsd_portshaker::config') }

        it { should contain_service('freebsd_portshaker') }
        it { should contain_package('freebsd_portshaker').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'freebsd_portshaker class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('freebsd_portshaker') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
