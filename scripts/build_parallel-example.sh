#!/bin/bash
#
# This will parse files in versions directory and generate
# binary rubies for the current OS. Once generated, the src
# directory will be removed in order to save on hdd space
#
# TODO:
#	- automatic generation of sumfiles
#

for RUBYVER_FILE in versions/*.txt; do
	echo -e "\\033[1mProcessing ruby version file: ${RUBYVER_FILE}\\033[0m";
	cat ${RUBYVER_FILE} | nice -n -20 parallel -j+0 --eta 'nice -n -20 /usr/local/rvm/bin/rvm --debug install --skip-gemsets --movable {} && nice -n -20 /usr/local/rvm/bin/rvm --debug prepare --path {}; rm -rf /usr/local/rvm/src/ruby-{}';
done
