#!/bin/bash


cat versions/ruby-versions.txt | nice -n -20 parallel -j+0 --eta 'nice -n -20 /usr/local/rvm/bin/rvm --debug install --skip-gemsets --movable {} && nice -n -20 /usr/local/rvm/bin/rvm --debug prepare --path {}; rm -rf /usr/local/rvm/src/ruby-{}'
