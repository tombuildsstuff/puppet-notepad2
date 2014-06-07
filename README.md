Puppet-Notepad2
===============

A puppet module to install Notepad2 on Windows Systems.


Installation
------------

Add this to your Puppetfile:
```puppet
mod 'tombuildsstuff/notepad2'
````

Usage
-----

You need to reference only a single class 'notepad2' - which handles the install process. You can do this like so:

```puppet
class { 'notepad2':
  ensure => 'present'
}
```

Testing
-------
This module's been tested on Windows Server 2008 R2 - it *should* work on 2012 as well, but I haven't tested it..

Contributing
------------
Send a pull request, ideally with tests :)

