## _binary-rubies_

Binary rubies for use with [_RVM_](https://rvm.io)

### Installation

  - Download the selected package to a temporary directory
  - Install the binaries using `rvm mount -r /path/or/url/of/package` 

### Informations

Binary rubies created using the following [_RVM_](https://rvm.io) commands

```shell
rvm --debug install --skip-gemsets --movable VERSION_NUMBER
rvm --debug prepare --path VERSION_NUMBER
```

### Warning

Altho it could be tempting to clone this repository, i must warn you that it contains ALOT of files
and is of considerable size. To solve this, you can clone a branch called _scripts-only_ which will
allow to clone the repo without all the already compiled binary files.

```shell
git clone -b scripts-only --single-branch https://github.com/speedinternet/binary-rubies.git
```

### Credits/Thanks

  - [_RVM_](https://rvm.io) - Ruby version manager
  - [_GNU Parallel_](https://www.gnu.org/software/parallel) - Shell tool for executing jobs in parallel
