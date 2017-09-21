# repo_mssql::os::redhat
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include mssql_linux::os::redhat
class repo_mssql::os::redhat {
  class { 'repo_msprod':
    repourl           => 'https://packages.microsoft.com/config/rhel/7/mssql-server.repo',
    enable_mirrorlist => false,
  }

  package { 'mssql-server': 
    ensure => present
  }
}
