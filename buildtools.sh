#!/bin/bash

function runBuildTools()
{
	RWDIR=${RWDIR:-"/var/php5.6buildtools"} # Remote working directory
	VOLUME_MODE=${VOLUME_MODE:-"r"} # Read or ReadWrite?

	docker run -rm -i -t \
	  --volume  ${PWD}:${RWDIR}:${VOLUME_MODE} \
	  --workdir        ${RWDIR} \
	  denisristic/php5.6buildtools $@
}

function runPhpInternalServer()
{
	RWDIR=${RWDIR:-"/var/php5.6buildtools"} # Remote working directory
	VOLUME_MODE=${VOLUME_MODE:-"r"} # Read or ReadWrite?

	# Address & port to bind to
	PHPS_PORT=${PHPS_PORT:-"80"}
	PHPS_HOST=${PHPS_HOST:-"0.0.0.0"}

	docker run -rm -i -t \
	  --volume  ${PWD}:${RWDIR}:${VOLUME_MODE} \
	  --workdir        ${RWDIR} \
	  --publish ${PHPS_PORT}:${PHPS_PORT} \
	  denisristic/php5.6buildtools \
	  php -S ${PHPS_HOST}:${PHPS_PORT} -t ${RWDIR} $@
}


# CLI
alias php="runBuildTools php"
# Try it: php -r 'echo getcwd(); print_r(`ls -lsa`);'

# Server
alias php-server="runPhpInternalServer"

# Tools
alias composer="runBuildTools composer"
alias pear="runBuildTools pear"
alias phpunit="runBuildTools phpunit"
alias phpcpd="runBuildTools phpcpd"
alias phpdcd="runBuildTools phpdcd"
alias phploc="runBuildTools phploc"
alias pdepend="runBuildTools pdepend"
alias phpcs="runBuildTools phpcs"
alias phpmd="runBuildTools phpmd"
alias behat="runBuildTools behat"