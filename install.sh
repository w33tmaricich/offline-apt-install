#!/bin/bash
set -eu

# Main logic.
main () {

    # Add the directory to apt-sources.list
    #echo "deb file:~/oai/apt-deps ./" | tee /etc/apt-sources.list
    echo "deb file:~/oai/apt-deps ./" | tee /etc/apt/sources.list


    # Update the sources
    apt-get update
    apt-get install $@
    echo "...Done."
}

main $@
