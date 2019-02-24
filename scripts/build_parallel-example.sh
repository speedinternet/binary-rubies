#!/bin/bash
#
# This will parse files in versions directory and generate
# binary rubies for the current OS. Once generated, the src
# directory will be removed in order to save on hdd space
#

# Get arch info
OSARCH=$(uname -m);

# Get release infos fomr /etc/os-release file
[[ -f /etc/os-release ]] && source /etc/os-release

# For each version file
for RUBYVER_FILE in versions/*.txt; do

	echo -e "\\033[1mProcessing ruby version file: ${RUBYVER_FILE}\\033[0m";
	cat ${RUBYVER_FILE} | nice -n -20 parallel -j+0 --eta 'nice -n -20 /usr/local/rvm/bin/rvm --debug install --skip-gemsets --movable {} && nice -n -20 /usr/local/rvm/bin/rvm --debug prepare --path {}; rm -rf /usr/local/rvm/src/ruby-{}';

	# Generate md5sum if not already existing
	if [[ -d binaries/${ID}/${VERSION_ID}/${OSARCH} ]]; then
		pushd binaries/${ID}/${VERSION_ID}/${OSARCH} &>/dev/null;
			ls -1 *.tar.bz2 | xargs -n1 bash -c '[[ ! -f ${0}.md5 ]] && md5sum ${0} > ${0}.md5';
		popd &>/dev/null;
	fi

done
