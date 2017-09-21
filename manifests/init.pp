# Installs Yum repo for MSSQL: https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-overview
class repo_mssql () {

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