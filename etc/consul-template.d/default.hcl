
exec {
  command = "/usr/sbin/php5-fpm --nodaemonize --force-stderr --fpm-config /etc/php5/fpm/php-fpm.conf"
  splay = "5s"
  reload_signal = "SIGUSR2"
  kill_timeout = "30s"
}

template {
  source = "/etc/php5/fpm/php-fpm.conf.ctmpl"
  destination = "/etc/php5/fpm/php-fpm.conf"
}

template {
  source = "/etc/php5/fpm/pool.d/www.conf.ctmpl"
  destination = "/etc/php5/fpm/pool.d/www.conf"
}

template {
  source = "/etc/php5/fpm/conf.d/90-consul.ini.ctmpl"
  destination = "/etc/php5/fpm/conf.d/90-consul.ini"
}
