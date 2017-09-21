# Installs Yum repo for MSSQL: https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-overview
class repo_mssql () {

  case $::operatingsystem {
    centos, redhat, amazon, fedora: {
      class {'repo_mssql::os::redhat': }
    }
    default: {
      fail('ERROR: Your operating system is not supported for the MySQL repository')
    }
  } 
  
}