# IKEv2 VPN Server running on Docker

Recipe to build [`gaomd/ikev2-vpn-server`](https://registry.hub.docker.com/u/gaomd/ikev2-vpn-server/) Docker image.

## 1. Start the IKEv2 VPN Server

    docker run -d --name ikev2-vpn-server --privileged -p 500:500/udp -p 4500:4500/udp gaomd/ikev2-vpn-server

## 2. Generate a .mobileconfig file for iOS 8

*Replace `vpn1.example.com` with your own domain name and make sure it resolves to you server's IP address.*

    docker run -i -t --rm --volumes-from ikev2-vpn-server -e "HOST=vpn1.example.com" gaomd/ikev2-vpn-server generate-mobileconfig > ikev2-vpn.mobileconfig

This will generate an `ikev2-vpn.mobileconfig` file, transfer it your local computer via SSH tunnel (`scp`) or any other secure methods, then E-mail it to your iOS 8 devices via E-mail attachment.

*IKEv2 protocol requires iOS 8 or later, Mac OS X 10.10 (Yosemite) is not supported yet.*
