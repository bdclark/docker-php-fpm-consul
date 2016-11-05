# php-php-consul Docker image

Docker image that runs PHP-FPM with its configuration driven via
[Consul-Template][1].

## Environment Variables
Use `PHP_FPM_CONF_KEY` to set the key prefix where the php-fpm configuration
will be found in Consul. If not set, `php-fpm` will be used.

PHP ini settings can be configured by specifying the  `PHP_INI_COMMON_KEY` and/or
the `PHP_INI_KEY` environment variables to set the key prefix for ini key/value
settings.  Settings found in the `PHP_INI_COMMON_KEY` will be rendered before
those found in `PHP_INI_KEY`, the idea being global/common settings can be shared
between multiple applications, and overridden at the application level.

Any values specified in php ini keys will be rendered as-is, so you might need
to include quotes when entering them into Consul.

The `PHP_TIMEZONE` environment variable is used to set the `date.timezone` ini
setting, and defaults to UTC.

Also, you must set `CONSUL_HTTP_ADDR` in order for consul-template to render
any templates when the container runs. Any supported consul-template environment
variables can be used, such as:

- CONSUL_HTTP_ADDR
- CONSUL_HTTP_TOKEN
- CONSUL_HTTP_AUTH
- CONSUL_HTTP_SSL
- CONSUL_HTTP_SSL_VERIFY

## Supported Consul keys
- `<PHP_FPM_CONF_KEY>/global/*` - global PHP-FPM key/value settings
- `<PHP_FPM_CONF_KEY>/pool/www/listen_port` - www named pool listen port
  (defaults to `9000`)
- `<PHP_FPM_CONF_KEY>/pool/www/*` - other www named pool settings

[1]: https://github.com/hashicorp/consul-template
