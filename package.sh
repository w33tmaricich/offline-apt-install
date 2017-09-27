#!/bin/bash
set -eu

# Retrieve a list of all dependancies a package relies on.
depslist () {
    apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances --no-pre-depends $@ | grep "^\w"
}

# Download all debian files associated with a package.
dld () {
    depslist $@ | xargs apt-get download
    apt-get download $@
}

# Main logic
main () {
    # Get our tools.
    sudo apt-get update
    sudo apt-get install dpkg-dev tar gzip

    # Create a directory to save the debian files to.
    mkdir -p oai/apt-deps
    cd oai/apt-deps

    # Download all debian files.
    dld $@

    # Create apt packages file.
    dpkg-scanpackages . | gzip -9c > Packages.gz

    # Create a tarfile of everything you need on the remote machine.
    cd ../..
    cp install.sh README.md oai/
    tar -cvzf oai.tar.gz oai/
    echo "...Done."
    
}

main $@
