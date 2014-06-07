# == Class: notepad2::install
#
# Class which installs Notepad2

class notepad2::install
{
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  validate_string($notepad2::downloadDirectory)
  validate_string($notepad2::installerFileName)
  validate_string($notepad2::installerUrl)

  ensure_resource('file', $notepad2::downloadDirectory, { ensure => directory })
  download_file { 'notepad2::install::download':
    destination_directory => $notepad2::downloadDirectory,
    require               => File[$notepad2::downloadDirectory],
    url                   => "${notepad2::installerUrl}/${notepad2::installerFileName}"
  }

  exec { 'notepad2::install::run':
    command   => "${notepad2::installerFileName} /QUIET",
    creates   => 'C:\\Program Files\\Notepad2',
    logoutput => true,
    path      => $notepad2::downloadDirectory,
    require   => Download_file['notepad2::install::download'],
  }
}
