# == Class: notepad2::params
#
# Default values for notepad2

class notepad2::params {
  $downloadDirectory = 'c:\temp'
  $installerUrl      = 'http://www.flos-freeware.ch/zip'
  $version           = '4.2.25'
  $installerFileName = "Notepad2_${version}_x64.exe"
}
