#!/bin/bash
#
# This takes in a version number and generate binary
# rubies for the current OS. Once generated, the src
# directory will be removed to save on hdd space.
#

[[ $# -eq 0 ]] && {
	echo -e "\\033[1mMust provide at least one ruby version to process\\033[0m";
	exit 1;
}

# Get arch info
OSARCH=$(uname -m);

# Get release infos fomr /etc/os-release file
[[ -f /etc/os-release ]] && source /etc/os-release

# For each version file
for RUBYVER in ${@}; do

	echo -e "\\033[1mProcessing ruby version: ${RUBYVER}\\033[0m";
	nice -n -20 /usr/local/rvm/bin/rvm --debug install --skip-gemsets --movable ${RUBYVER} && \
	nice -n -20 /usr/local/rvm/bin/rvm --debug prepare --path ${RUBYVER};
	rm -rf /usr/local/rvm/src/ruby-${RUBYVER};

	# Generate md5sum if not already existing
	if [[ -d binaries/${ID}/${VERSION_ID}/${OSARCH} ]]; then
		pushd binaries/${ID}/${VERSION_ID}/${OSARCH} &>/dev/null;
			ls -1 *.tar.bz2 | xargs -n1 bash -c '[[ ! -f ${0}.md5 ]] && md5sum ${0} > ${0}.md5';
		popd &>/dev/null;
	fi

done
