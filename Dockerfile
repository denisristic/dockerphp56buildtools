FROM centos:7
MAINTAINER Denis Ristic <web@denisristic.com>

ENV CENTOS_FRONTEND noninteractive

# PHP binary & extensions
RUN yum -y -q update
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum clean all
RUN yum -y install php56w php56w-cli php5w-common
RUN yum -y install php56w-curl php56w-xdebug php56w-readline php56w-curl php56w-intl php56w-xml php56w-mbstring

# Additional composer
ADD https://getcomposer.org/composer.phar /usr/bin/composer
RUN chmod 0777 /usr/bin/composer

RUN composer global require \
	'phpunit/phpunit=5.6.*' \
	'sebastian/phpcpd=2.0.*' \
	'sebastian/phpdcd=1.*' \
	'squizlabs/php_codesniffer=3.0.0RC1' \
	'phploc/phploc=3.*' \
	'pdepend/pdepend=2.2.*' \
	'phpmd/phpmd=2.4.*' \
	'behat/behat=3.2.*'

# Add path to composed tools
ENV PATH /root/.composer/vendor/bin:$PATH

# Custom configuration
ADD php.ini /etc/php.d/99-php.ini


CMD ["/usr/bin/php" , "-a"]