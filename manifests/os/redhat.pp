# repo_mssql::os::redhat
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include mssql_linux::os::redhat
class repo_mssql::os::redhat {

  # Limit to version 7 as pre-req
  case $::operatingsystem {
    centos, redhat, amazon, fedora: {
      $baseurl = "https://packages.microsoft.com/rhel/7/mssql-server/"
    }
    default: {
      fail('ERROR: Your operating system is not supported for the MySQL repository')
    }
  } 

  Yumrepo {
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'https://packages.microsoft.com/keys/microsoft.asc',
  } 

  yumrepo { "mssql-repo":
      baseurl  => "${baseurl}",
      descr    => "Microsoft SQL Server"
  }

  package { 'mssql-server': 
    ensure => present
  }

}
