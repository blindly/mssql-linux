# Installs Yum repo for MSSQL: https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-overview
class repo_mssql () {

  case $::operatingsystem {
    centos, redhat, amazon, fedora: {
      $baseurl = "https://packages.microsoft.com/config/rhel/${::os_maj_version}/mssql-server.repo"
    }
    default: {
      fail('ERROR: Your operating system is not supported for the MySQL repository')
    }
  }

  Yumrepo {
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/microsoft.asc',
  }

  file { '/etc/pki/rpm-gpg/microsoft.asc':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/repo_mysql/microsoft.asc',
  }
  ->
  yumrepo { "repo_mssql":
      baseurl  => "${baseurl}",
      descr    => "Microsoft SQL Server"
  }

  package { 'mssql-server': 
    ensure => present
  }
}
