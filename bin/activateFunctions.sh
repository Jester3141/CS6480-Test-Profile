

# Checks to ensure that the 5G core is setup and ready to go
CheckFor5GCoreSetup () {
    # Double check that we have properly finished setup and building of the 5g core.
    # the easiest way to do this is to check for the presence of the docker executable
    if [ ! -f /usr/bin/docker ]; then
        echo "Docker not installed.  This indicates the 5G core is not installed."
        echo "You can install it with the following command:"
        echo ""
        echo "sudo ./deploy-srs.sh release_24_04 srsRAN_Project"
        echo ""
        exit 1
    fi

}





# Checks to ensure that the 4G GNB is setup and ready to go
CheckFor4gGNBSetup () {
    # Double check that we have properly finished setup and building of the 4G GNB.
    # the easiest way to do this is to check for the presence of the gnb executable
    if [ ! -f /etc/srsran/gnb.conf ]; then
        echo "gnb not installed.  This indicates the gnb client is not installed yet"
        echo "You can install it with the following command:"
        echo ""
        echo "sudo ./deploy-srs.sh release_23_11 srsRAN_4G"
        echo ""
        exit 1
    fi


}

