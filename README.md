# IKEv2 VPN Server running on Docker

Recipe to build `gaomd/ikev2-vpn-server` Docker image.

## Start the IKEv2 VPN Server

    CONTAINER_ID=$(docker run -d --privileged \
        -p 500:500/udp -p 4500:4500/udp \
        gaomd/ikev2-vpn-server)

## Generate .mobileconfig file for iOS 8

IKEv2 protocol requires iOS 8 or later, Mac OS X 10.10 (Yosemite) is not supported yet.

    # Fill in you actual domain name,
    # and make sure it resolves to you server's IP address.
    export HOST="vpn1.example.com"

    docker run -i -t --rm --volumes-from ${CONTAINER_ID} \
        -e "HOST=${HOST}" gaomd/ikev2-vpn-server \
        generate-mobileconfig > "${HOST}.mobileconfig"

After you've generated the `*.mobileconfig` file, firstly, transfer it your local computer via SSH tunnel (`scp`) or any other secure methods.

You may now open this file on your iOS 8 device (via E-mail attachment or AirDrop?, etc).
