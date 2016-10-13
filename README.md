# PHP 5.6 Build Tools

Welcome to [PHP5.6BuildTools](https://index.docker.io/u/denisristic/php5.6buildtools/) container.

This image updated version from [PHPEssentials](https://index.docker.io/u/darh/php-essentials/).

Main purpuse of this container is to provide easy to use PHP CLI and other essential tools for debuging and testing your PHP applications.


## Contents
 * Centos 7
 * PHP 5.6.* ([ondrej](https://launchpad.net/~ondrej/+archive/php5)'s repos)
 * [Composer](https://getcomposer.org/)
 * [Pear](http://pear.php.net/)
 * [PHPUnit](http://phpunit.de/) v5.6
 * [PHP Copy/Paste Detector - phpcpd](https://github.com/sebastianbergmann/phpcpd) v2.0
 * [PHP Dead Code Detector - phpdcd](https://github.com/sebastianbergmann/phpdcd) v1
 * [Measuring the size and analyzing the structure of a PHP project - phploc](https://github.com/sebastianbergmann/phploc) v3
 * [PHP software metrics - pdepend](http://pdepend.org/) v2.2
 * [PHP Code sniffer- phpcs](http://pear.php.net/package/PHP_CodeSniffer) v3.0
 * [PHP Mess Detector - phpmd](http://phpmd.org/) v2.4
 * [Behaviour driven development for PHP - behat](http://behat.org/) v3.2


## Get it
```sh
docker pull denisristic/php5.6buildtools
```

## Run it
Container is give you PHP's interactive mode by default:
```sh
docker run --rm -i -t denisristic/php5.6buildtools
```
Docker's [run command reference manual](http://docs.docker.io/en/latest/reference/run/)

## See enabled modules, settings:
```sh
docker run --rm -i -t denisristic/php5.6buildtools php -m
docker run --rm -i -t denisristic/php5.6buildtools php -i
```

## Run PHP's [internal server](http://www.php.net/manual/en/features.commandline.webserver.php) (a totally useless example)
```sh
docker run --publish 80:80 --rm -t -i denisristic/php5.6buildtools \
  php -S 0.0.0.0:80
```


## The tools:
```sh
docker run --rm -i -t denisristic/php5.6buildtools composer
docker run --rm -i -t denisristic/php5.6buildtools pear
docker run --rm -i -t denisristic/php5.6buildtools phpunit
docker run --rm -i -t denisristic/php5.6buildtools phpcpd
docker run --rm -i -t denisristic/php5.6buildtools phpdcd
docker run --rm -i -t denisristic/php5.6buildtools phploc
docker run --rm -i -t denisristic/php5.6buildtools pdepend
docker run --rm -i -t denisristic/php5.6buildtools phpcs
docker run --rm -i -t denisristic/php5.6buildtools phpmd
docker run --rm -i -t denisristic/php5.6buildtools behat
```
Please note, that running things like `composer autoupdate` is futile as
container & it's content will be removed when command finishes.
If there's a newer version add an issue on Github or rebuild the
php-essentials image yourself.


# Use it
All above example are useless as presented as the code runs in the container
and none of the examples actualy maps local files to the container:

A bit more usefull example -- adding volume param that maps the
current folder and hinting PHP server where it's document root is
```sh
docker run --volume `pwd`:/opt/web/page:r --publish 80:80 --rm -t -i denisristic/php5.6buildtools \
  php -S 0.0.0.0:80 -t /opt/web/page
```

Do you want to run this long chain every time?

# Solving local/host-remote/container issue with some quick shell scripting
Include essentials.sh file (or it's contents) to bashrc or similar file. This
will enable you to run all these commands as if they were installed on
your local machine

----

# Build it
In case you want to build it yourself
```sh
docker build --rm -t denisristic/php5.6buildtools .
```

# Bash
```sh
docker run --rm -i -t denisristic/php5.6buildtools bash
```