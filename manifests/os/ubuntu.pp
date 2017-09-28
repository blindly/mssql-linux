class repo_mssql::os::ubuntu {

  # Limit to version 16.04 as pre-req
  case $::operatingsystem {
    ubuntu: {
      $baseurl = "https://packages.microsoft.com/ubuntu/16.04/mssql-server/"
    }
    default: {
      fail('ERROR: Your operating system is not supported for the MySQL repository')
    }
  }

  apt::source { 'sql-repo':
    location          => 'https://packages.microsoft.com/ubuntu/16.04/mssql-server/',
    release           => 'xenial',
    allow_unsigned    => true,
  } ->
  package { 'mssql-server':
    ensure => 'installed',
  }
}
