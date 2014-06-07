# == Class: notepad2
#
# Module to install Notepad2 on Windows.
#
# === Parameters
#
# [*downloadDirectory*]
#   The directory where the Notepad2 installer will be downloaded
#
# [*installerFileName*]
#   The file name for the Notepad2 installer
#
# [*installerUrl*]
#   The root url where the Notepad2 installer is hosted
#
# [*version*]
#   Defined which version of Notepad2 you want to be installed.
#

class notepad2 (
  $downloadDirectory = $notepad2::params::downloadDirectory,
  $installerFileName = $notepad2::params::installerFileName,
  $installerUrl      = $notepad2::params::installerUrl,
  $version           = $notepad2::params::version
) inherits notepad2::params
{
  validate_string($downloadDirectory)
  validate_string($installerFileName)
  validate_string($installerUrl)
  validate_string($version)

  case downcase($::osfamily)
  {
    'windows':
    {
      class { 'notepad2::install': } ->
      Class['notepad2']
    }

    default:
    {
      fail('This module only supports Windows')
    }
  }
}
