require 'spec_helper'

describe 'notepad2', :type => :class do

  ##########
  # Set Up #
  ##########
  let(:facts) { {
    :osfamily  => 'Windows'
  } }
  let(:params) {{
    :downloadDirectory => 'c:\\temp',
    :installerFileName => "Notepad2_4.2.25_x64.exe",
    :installerUrl      => 'http://www.flos-freeware.ch/zip',
    :version           => '4.2.25'
  }}

  ###########
  # Install #
  ###########
  context 'installing notepad2' do
    it { should contain_class('notepad2') }
    it { should contain_file('c:\\temp').with_ensure('directory') }
    it { should contain_download_file('notepad2::install::download')
                       .with_url('http://www.flos-freeware.ch/zip/Notepad2_4.2.25_x64.exe')
                       .with_destination_directory('c:\\temp') }

  end

  ############
  # Wrong OS #
  ############
  context 'when trying to install on Ubuntu' do
    let(:facts) { {:osfamily => 'Ubuntu'} }
    it do
      expect {
        should contain_class('notepad2')
      }.to raise_error(Puppet::Error, /^This module only supports Windows/)
    end
  end

end
