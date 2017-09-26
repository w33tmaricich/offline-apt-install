# offline-apt-install

Two scripts that are used to install apt packages in an offline environment.

## Instructions
1. Run package.sh on a machine with internet. package.sh takes a list of
   debian packages you wish to install.
2. Move the created tar and install.sh to the machine with no internet.
3. Run install.sh. install.sh takes the same list of debian packages.
